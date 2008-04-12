# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
   helper :all # include all helpers, all the time
   before_filter :configura_empresa_e_usuario
   after_filter :salva_empresa_e_usuario

   # See ActionController::RequestForgeryProtection for details
   # Uncomment the :secret if you're not using the cookie session store
   protect_from_forgery # :secret => '4f230c6661eaa85d79723e862c591e44'

=begin
Este método busca da session em cada inicio de request o usuário logado e a empresa selecionada para que a variável de classe funcione corretamente
=end
   def configura_empresa_e_usuario
      Usuario.usuario_logado = session[:usuario_logado]
      Empresa.empresa_selecionada = session[:empresa_selecionada]
   end
=begin
Este método busca das classes Usuario e Empresa o usuario logado e a empresa selecionada e salva na sessão para que seja possível recuperar no próximo request
=end
   def salva_empresa_e_usuario
      session[:usuario_logado] = Usuario.usuario_logado
      session[:empresa_selecionada] = Empresa.empresa_selecionada
   end
end
