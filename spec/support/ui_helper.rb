module UIHelper
  def chunk_input(i)
    chunk_inputs[i]
  end

  def chunk_inputs
    all('textarea')
  end

  def chunk_box(index)
    chunk_boxes[index]
  end

  def chunk_boxes
    all('.chunk-box')
  end

  def chunk_remover(i)
    all('.chunk-remover')[i]
  end

  def chunk_adder
    find('#chunk-adder')
  end
end

RSpec.configure do |config|
  config.include UIHelper, type: :feature
end
