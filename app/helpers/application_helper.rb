require 'vendor/plugins/hydra-head/app/helpers/application_helper.rb'
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # overridden for localization
  def application_name
    'Hypatia'
  end
  
  # display the Solr values populated per the datastream model within a fieldset html tag
  #  this is a local helper method created to avoid all the repeated stuff in hydra-head/app/views/mods_assets/_show_description.html.erb
  def display_ds_values_as_fieldset(dsid, solr_fld_sym, display_label)
    values = get_values_from_datastream(@document_fedora, dsid, [solr_fld_sym])
    unless values.first.empty?
      result = "<fieldset><legend>#{display_label}</legend><div class=\"browse_value\">#{values.join(', ')}</div></fieldset>"
    end
    result 
  end

  # display the Solr values populated per the datastream model with dt and dd html tags
  def display_ds_values_as_dl_element(dsid, solr_fld_sym, display_label)
    values = get_values_from_datastream(@document_fedora, dsid, [solr_fld_sym])
    unless values.first.empty?
      result = "<dt>#{display_label}</dt><dd>#{values.join(', ')}</dd>"
    end
    result 
  end
  
  def get_datastream_url_from_content_md(fedora_obj, filename, file_asset_pid_fld, file_ds_id_fld)
    if filename.is_a?(Symbol)
      filename = get_values_from_datastream(fedora_obj, "contentMetadata", filename)
    end
    file_asset_pid = get_values_from_datastream(fedora_obj, "contentMetadata", file_asset_pid_fld)
    file_ds_id = get_values_from_datastream(fedora_obj, "contentMetadata", file_ds_id_fld).first
    asset_downloads_path(file_asset_pid, :download_id=>file_ds_id)
  end
  
end
