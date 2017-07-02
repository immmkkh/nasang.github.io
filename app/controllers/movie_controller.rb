class MovieController < ApplicationController
  def index
    
            require 'nokogiri' #노코기리를 쓰려고 적는 것
            require 'open-uri' 
            
           bike = "http://www.cine21.com/movie/lists/playing"
     @doc = Nokogiri::HTML(open(bike))
     
     @temp = @doc.xpath('//span[@class="tit"]')
     @link = @doc.xpath('//ul[@class="mov_info_list"]/li/a').map { |link| link['href'] }
     
     
  end
  
  def result
    require 'nokogiri' #노코기리를 쓰려고 적는 것
    require 'open-uri' 
    require 'cgi'
    
    search = CGI::escape(params[:moviename])
    
    
    bike = "http://www.cine21.com/search/movie/?q=#{search}"
    @result = Nokogiri::HTML(open(bike))
    
    @moviename = params[:moviename]
    
    @name = @result.xpath('//p[@class="name"]/a')
    @link = @result.xpath('//ul[@class="mov_list"]/li/a').map { |link| link['href'] }
    
    
    
  end
  
end