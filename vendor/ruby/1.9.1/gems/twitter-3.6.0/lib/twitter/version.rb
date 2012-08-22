module Twitter
  class Version
    MAJOR = 3 unless defined? Twitter::MAJOR
    MINOR = 6 unless defined? Twitter::MINOR
    PATCH = 0 unless defined? Twitter::PATCH
    PRE = nil unless defined? Twitter::PRE

    class << self

      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end

    end

  end
end
