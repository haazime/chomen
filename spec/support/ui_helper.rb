module UIHelper

  def wait_save
    find('#toast-container')
  end

  def delete_chunk_button
    first('.delete-chunk')
  end
end
