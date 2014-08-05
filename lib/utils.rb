module Utils
  def self.gsub_month_is_to_en(string)
    month_map = {
      'janúar'    => 'January',
      'febrúar'   => 'February',
      'mars'      => 'March',
      'apríl'     => 'April',
      'maí'       => 'May',
      'júní'      => 'June',
      'júlí'      => 'July',
      'ágúst'     => 'August',
      'september' => 'September',
      'október'   => 'October',
      'nóvember'  => 'November',
      'desember'  => 'December'
    }
    string.gsub(/#{month_map.keys.join('|')}/, month_map)
  end
end
