class RodaGraphql < Roda
  def self.css_files
    [].tap do |css|
      # css << "main.css"
    end
  end

  def self.js_files
    [].tap do |js|
      # js << "main.js"
    end
  end

  dependencies = Hash.new(Dir["assets/" "**/*.*"])

  self.plugin :assets, css: css_files, js: js_files, dependencies: dependencies
  compile_assets if production?
end
