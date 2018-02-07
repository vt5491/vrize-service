class ExampleExtractor
  require 'pp'

  # this is a hash of extracted data
  attr_reader :file_info_hash
  # @file_info_hash

  def initialize
    @file_info_hash = []
  end

  # def self.do_it
  def do_it
    # @file_info[:a] = 17
    17
  end

  # place all '.html' example names info @file_info_hash
  #
  # This is the main loop.  Since we want to loop over the array of files only
  # once, this will be that loop and it will call any individual record level
  # methods to extract specific infomration.
  def extract_examples_main(dir: )
    # p "Extractor.get_file_names: dir=#{dir}"
    files = Dir.entries(dir)

    # we loop over the dir once to seed the initial @file_info_hash
    files.each { |f|
      next if (!f.match(/\.html$/))
      # p "get_file_name.f=#{f}"
      f_hash = {:name => f}
      @file_info_hash.push f_hash
    }

    # Now we loop over the hash once to add further decorations
    @file_info_hash.each { |file_info|
      extract_keywords :file_info => file_info
    }
  end

  ############################
  #
  #  row level methods go here
  #
  ############################
  # extract the first three stanzas from each filename e.g
  # 'webgl_shadowmap_viewer.html' -> ['webgl', 'shadowmap', 'viewer']
  # def extract_name_info_from_fn(fn:)
  def extract_stanzas(fn:)
    result = []

    # switch on the number of "stanzas" in the fn
    # three or greater stanzas
    if fn.match(/([^_\.]+)_([^_]+)_([^_\.]+)/)
      m = fn.match(/([^_\.]+)_([^_]+)_([^_\.]+)/)

      result[0] = m[1]
      result[1] = m[2]
      result[2] = m[3]
    # two stanzas
    elsif fn.match(/([^_\.]+)_([^_\.]+)/)
      m = fn.match(/([^_\.]+)_([^_\.]+)/)

      result[0] = m[1]
      result[1] = m[2]
    else
      p "Extractor.extract_name_info_from_fn: found a one-header: #{fn}"
    end

    result
  end

  def extract_keywords(file_info:)
    fn = file_info[:name]

    stanzas = extract_stanzas :fn => fn

    keyword_1 = stanzas[0]
    keyword_2 = stanzas[1] if stanzas[1]
    keyword_3 = stanzas[2] if stanzas[2]

    file_info[:category] = keyword_1 if keyword_1;
    file_info[:keyword_1] = keyword_2 if keyword_2;
    file_info[:keyword_2] = keyword_3 if keyword_3;

  end

  ###########################
  #
  #  file_info_hash methods are here.
  #
  #  These are methods that process @file_info_hash as a whole
  #  and not at the individual file_info row level
  #
  ############################
  # get count of each of the first three stanza
  def stanza_stats(file_info_hash: fih)
    stanza1_stats = Hash.new
    stanza2_stats = Hash.new
    stanza3_stats = Hash.new

    # @file_info[0..5].each { |f|
    # @file_info.each { |f|
    @fih.each { |f|
      # you can call extract_keywords here instead of duplicating this code.
      # actually ..not true, since this is an aggregator
      fn = f[:name]
      # p "stanza_stats: fn=#{fn}"

      # stanzas = extract_name_info_from_fn :fn => fn
      stanzas = extract_stanzas :fn => fn

      # p "#{fn}: s1=#{stanzas[0]}, s2=#{stanzas[1]}, s3=#{stanzas[2]}"

      k1 = stanzas[0]
      k2 = stanzas[1] if stanzas[1]
      k3 = stanzas[2] if stanzas[2]
      # p "k0=#{k0}"
      # p "k2=#{k2}"
      if !(stanza1_stats[k1])
        stanza1_stats[k1] = 0
      end

      if !(stanza2_stats[k2])
        stanza2_stats[k2] = 0
      end

      if !(stanza3_stats[k3])
        stanza3_stats[k3] = 0
      end

      stanza1_stats[k1] = stanza1_stats[k1] + 1
      stanza2_stats[k2] = stanza2_stats[k2] + 1 if k2
      stanza3_stats[k3] = stanza3_stats[k3] + 1 if k3
      # stanza2_stats[stanzas[1]]++
      # stanza3_stats[stanzas[2]]++
=begin
=end

    }

    # p "stanza_stats: stanza1_stats="
    # pp stanza1_stats

    # return_hash = {:stanza1_stats => stanza1_stats, :stanza1_stats => stanza2_stats, :stanza3_stats => stanza3_stats}
    # stanza1_stats
    return_hash = Hash.new
    return_hash[:s1] = stanza1_stats
    return_hash[:s2] = stanza2_stats
    return_hash[:s3] = stanza3_stats

    return_hash

  end

end
