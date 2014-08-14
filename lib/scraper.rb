module Scraper
  BASE_URI = 'http://www.althingi.is/lagas/nuna/kaflar/'
  CHAPTERS_URI = "#{BASE_URI}kaflar.html"

  def self.scrape
    puts "Starting to scrape althingi.is for laws...\n"
    duration = Benchmark.measure { scrape_all_chapters }.real
    puts "\nIssues:   #{Version.count}"
    puts "Chapters: #{Chapter.count}"
    puts "Laws:     #{Law.count}"
    puts 'Duration: %.3f seconds' % duration
  end

  def self.scrape_all_chapters
    doc = Nokogiri::HTML(HTTParty.get(CHAPTERS_URI))
    version = doc.css('hr').first.next_sibling.text[/útgáfa \w+/].split.last
    version_id = Version.create(name: version).id
    chapter_uris = doc.css('a').each_with_index do |node, index|
      page = node.attributes['href'].value
      chapter_id = Chapter.create(
        version_id: version_id,
        ordinal: index + 1,
        name: node.text
      ).id
      scrape_chapter(page, version_id: version_id, chapter_id: chapter_id)
    end
  end

  def self.scrape_chapter(page, opts)
    doc = Nokogiri::HTML(HTTParty.get("#{BASE_URI}#{page}"))
    subchapters = doc.css('h3')
    subchapters.each do |subchapter|
      ord = subchapter.text.split.first
      subsubchapters = doc.css('h4').select { |h4| h4.text.starts_with?(ord) }
      subsubchapters.each do |subsubchapter|
        subsubchapter.next_sibling.next_sibling.css('li').each do |node|
          attrs = parse_li(node).merge(opts)
          create_law(attrs.merge(
            subchapter: subchapter.text,
            subsubchapter: subsubchapter.text
          ))
        end
      end
      nodes = subchapter.next_sibling.next_sibling.css('li')
      if nodes.empty?
        attrs = parse_li(subchapter.next_sibling.next_sibling).merge(opts)
        create_law(attrs.merge(subchapter: subchapter.text))
      else
        nodes.each do |node|
          attrs = parse_li(node).merge(opts)
          create_law(attrs.merge(subchapter: subchapter.text))
        end
      end
    end
    if subchapters.size == 0
      doc.css('li').each do |node|
        create_law(parse_li(node).merge(opts))
      end
    end
  end

  def self.parse_li(node)
    return {} if node.children.size <= 1
    name = parse_name(node)
    ordinal_and_date = node.css('a').last.text.split
    if ordinal_and_date == ['Kaflar', 'lagasafns']
      # Special case for 1.d., which is not properly formatted.
      if node.children[0].text == 'Lög um framkvæmd þjóðaratkvæðagreiðslna, '
        name = node.children[0].text[0..-3]
        ordinal_and_date = node.children[1].text.split
      else
        return {}
      end
    end
    date = if ordinal_and_date.size == 1
      "January #{ordinal_and_date.first}"
    else
      Utils.gsub_month_is_to_en(ordinal_and_date.last(3).join(' '))
    end
    begin
      ordinal = Integer(ordinal_and_date[1][/\d+/])
    rescue
      if (parsed = node.children[1].text[/nr\.\ \d+/])
        ordinal = parsed.split.last
      end
    end
    uri = node.children[1].attributes['href'].value
    {
      name: name,
      original_uri: uri,
      ordinal: ordinal,
      date: date,
      raw_html: HTTParty.get(uri).to_s.encode(Encoding::UTF_8)
    }
  end

  def self.parse_name(node)
    link_text = node.children.css('a').last.text
    all_text = node.children.map(&:text).join
    all_text[0..all_text.index(link_text) - 3]
  end

  def self.create_law(attrs)
    law = Law.create(attrs)
    puts "Created '#{law.name}'." if law.persisted?
  end
end
