# encoding: utf-8

module FFaker
  module Filesystem
    extend ModuleUtils
    extend self

    EXTENSION = %w(flac mp3 wav bmp gif jpeg jpg png tiff css csv html js json txt mp4 avi mov webm doc docx xls xlsx ppt pptx odt ods odp pages numbers key pdf).freeze
    MIME_TYPE = %w(application/atom+xml application/ecmascript application/EDI-X12 application/EDIFACT application/json application/javascript application/ogg application/pdf application/postscript application/rdf+xml application/rss+xml application/soap+xml application/font-woff application/xhtml+xml application/xml-dtd application/xop+xml application/zip application/gzip audio/basic audio/L24 audio/mp4 audio/mpeg audio/ogg audio/vorbis audio/vnd.rn-realaudio audio/vnd.wave audio/webm image/gif image/jpeg image/pjpeg image/png image/svg+xml image/tiff image/vnd.microsoft.icon message/http message/imdn+xml message/partial message/rfc822 model/example model/iges model/mesh model/vrml model/x3d+binary model/x3d+vrml model/x3d+xml multipart/mixed multipart/alternative multipart/related multipart/form-data multipart/signed multipart/encrypted text/cmd text/css text/csv text/html text/javascript text/plain text/vcard text/xml video/mpeg video/mp4 video/ogg video/quicktime video/webm video/x-matroska video/x-ms-wmv video/x-flv).freeze

    SLUG_DELIMITERS = %w(- _ .).freeze

    def extension
      fetch_sample(EXTENSION)
    end

    def mime_type
      fetch_sample(MIME_TYPE)
    end

    def file_name(dir = nil, name = nil, ext = nil, directory_separator = '/')
      dir = Internet.slug unless dir
      name = Lorem.word.downcase unless name
      ext ||= extension
      [dir, name].join(directory_separator) + ".#{ext}"
    end
  end
end
