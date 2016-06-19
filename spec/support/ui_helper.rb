module UIHelper
  def chunk_input(i)
    chunk_inputs[i]
  end

  def chunk_inputs
    all('textarea')
  end

  def chunk_remover(i)
    all('.chunk-remover')[i]
  end

  def chunk_adder
    find('#chunk-adder')
  end
end
