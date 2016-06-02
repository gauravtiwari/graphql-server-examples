class RodaGraphql < Roda
  def self.css_files
    [].tap do |css|
      css << "graphiql-0.7.0.css"
      css << "main.css"
      css << "application.css"
    end
  end

  def self.js_files
    [].tap do |js|
      js << "react-15.0.1.js"
      js << "react-dom-15.0.1.js"
      js << "fetch-0.10.1.js"
      js << "graphiql-0.7.0.js"
    end
  end

  dependencies = Hash.new(Dir["assets/" "**/*.*"])

  self.plugin :assets, css: css_files, js: js_files, dependencies: dependencies
  compile_assets if production?
end
