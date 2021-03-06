require './test/test_helper'
require 'postmon_cli/wrapper'

class WrapperTest < Minitest::Test
  def setup
    @cep = PostmonCli::Wrapper.get_cep('49097320').to_s
    @cidade = PostmonCli::Wrapper.get_cidade('SE', 'Aracaju').to_s
    @estado = PostmonRuby::GemOutput.estado('SE').to_s
  end

  def test_get_cep
    assert_match(/Logradouro|Bairro|Complemento|Cidade|Estado|Cep/, @cep)
  end

  def test_get_cidade
    assert_match(/Area_km2|Codigo_ibge/, @cidade)
  end

  def test_get_estado
    assert_match(/Area_km2|Codigo_ibge|Nome/, @estado)
  end
end
