require 'fileutils'

# Função para renomear arquivos na pasta especificada
def renomear_arquivos(pasta, novo_formato)
  # Lista todos os arquivos na pasta
  arquivos = Dir.entries(pasta)

  # Percorre todos os arquivos na pasta
  arquivos.each do |arquivo|
    # Ignora pastas '.' e '..'
    next if arquivo == '.' || arquivo == '..'

    # Obtém o nome do arquivo sem a extensão
    nome_arquivo = File.basename(arquivo, '.*')

    # Obtém a extensão do arquivo
    extensao_arquivo = File.extname(arquivo)

    # Monta o novo nome do arquivo com o novo formato
    novo_nome_arquivo = "#{nome_arquivo}_#{novo_formato}#{extensao_arquivo}"

    # Renomeia o arquivo
    FileUtils.mv(File.join(pasta, arquivo), File.join(pasta, novo_nome_arquivo))
  end

  puts "Arquivos renomeados para o formato #{novo_formato} na pasta #{pasta}."
end

# Pasta onde os arquivos serão renomeados
pasta = '/caminho/da/pasta'

# Novo formato para os arquivos
novo_formato = 'novo_formato'

# Chama a função para renomear os arquivos
renomear_arquivos(pasta, novo_formato)
