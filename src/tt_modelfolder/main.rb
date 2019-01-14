require 'sketchup.rb'

module TT::Plugins::ModelFolder

  unless file_loaded?(__FILE__)
    menu = UI.menu('File').add_submenu('Model Folder')
    menu.add_item('Open from Model Folder') { self.open_from_model_folder }
    menu.add_item('Open Model Folder') { self.open_model_folder }
    file_loaded(__FILE__)
  end

  def self.open_from_model_folder
    model = Sketchup.active_model
    return unless model
    unless model.path.empty?
      folder = File.dirname(model.path)
      UI.openpanel('Open', folder, 'SketchUp Files (*.skp)|*.skp||')
    end
  end

  def self.open_model_folder
    model = Sketchup.active_model
    return unless model
    unless model.path.empty?
      folder = File.dirname(model.path)
      UI.openURL(folder)
    end
  end

end # module
