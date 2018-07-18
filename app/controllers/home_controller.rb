require ('nokogiri') 
require ('open-uri')
class HomeController < ApplicationController
  def index
    @movieQueries=[]
    
    uri = 'https://movie.naver.com/movie/sdb/rank/rmovie.nhn'
    doc = Nokogiri::HTML(open(uri))
    
    i = 1
    
    doc.css('.title .tit3').each do |r|
      rankKeyword = Hash.new
      nodeset = r.css('a')
      rankKeyword['rank'] = i
      rankKeyword['title'] = nodeset.map {|element| element["title"]}.compact.first
      rankKeyword['link'] = "https://movie.naver.com" + nodeset.map {|element| element["href"]}.compact.first
      @movieQueries << rankKeyword
      i += 1
    end

    @exhibitQueries1=[]
    @exhibitQueries2=[]
      
    uri = 'http://ticket.interpark.com/TPGoodsList.asp?Ca=Eve&SubCa=Eve_O'
    doc = Nokogiri::HTML(open(uri))
      
    doc.css('.RKthumb a').each do |r|
      exhibit = Hash.new
      nodeset = r.css('img')
      exhibit['image'] = nodeset.map {|element| element["src"]}.compact.first
      
      @exhibitQueries1 << exhibit
    end
    doc.css('.RKtxt .fw_bold').each do |r|
      exhibit = Hash.new
      nodeset = r.css('a')
      exhibit['link'] = "http://ticket.interpark.com"+ nodeset.map {|element| element["href"]}.compact.first
      exhibit['title'] = "#{nodeset.text}"
        
      @exhibitQueries2 << exhibit
    end
    t = Time.now + 9.hour #현재시간이 9시간 전으로 설정되어있어 9시간을 더해줌
    if t.wday == 5
      @webtoonQueries1=[]
      @webtoonQueries2=[]
      
      uri = 'https://comic.naver.com/webtoon/weekdayList.nhn?week=fri'
      doc = Nokogiri::HTML(open(uri))
      
      doc.css('.thumb a').each do |r|
        webtoon = Hash.new
        nodeset = r.css('img')
        webtoon['image'] = nodeset.map {|element| element["src"]}.compact.first
        
        @webtoonQueries1 << webtoon
      end
      
      doc.css('dl dt').each do |r|
        webtoon = Hash.new
        nodeset = r.css('a')
        webtoon['title'] = nodeset.map {|element| element["title"]}.compact.first
        webtoon['link'] = "https://comic.naver.com" + nodeset.map {|element| element["href"]}.compact.first
        
        @webtoonQueries2 << webtoon
      end
    elsif t.wday == 4
      @webtoonQueries1=[]
      @webtoonQueries2=[]
        
      uri = 'https://comic.naver.com/webtoon/weekdayList.nhn?week=thu'
      doc = Nokogiri::HTML(open(uri))
      
      doc.css('.thumb a').each do |r|
        webtoon = Hash.new
        nodeset = r.css('img')
        webtoon['image'] = nodeset.map {|element| element["src"]}.compact.first
        
        @webtoonQueries1 << webtoon
      end
      doc.css('dl dt').each do |r|
        webtoon = Hash.new
        nodeset = r.css('a')
        webtoon['title'] = nodeset.map {|element| element["title"]}.compact.first
        webtoon['link'] = "https://comic.naver.com" + nodeset.map {|element| element["href"]}.compact.first
        
        @webtoonQueries2 << webtoon
      end
    elsif t.wday == 3
        @webtoonQueries1=[]
        @webtoonQueries2=[]
          
        uri = 'https://comic.naver.com/webtoon/weekdayList.nhn?week=wed'
        doc = Nokogiri::HTML(open(uri))
      
        doc.css('.thumb a').each do |r|
          webtoon = Hash.new
          nodeset = r.css('img')
          webtoon['image'] = nodeset.map {|element| element["src"]}.compact.first
          
          @webtoonQueries1 << webtoon
        end  
        doc.css('dl dt').each do |r|
          webtoon = Hash.new
          nodeset = r.css('a')
          webtoon['title'] = nodeset.map {|element| element["title"]}.compact.first
          webtoon['link'] = "https://comic.naver.com" + nodeset.map {|element| element["href"]}.compact.first
          
          @webtoonQueries2 << webtoon
        end
      elsif t.wday == 2
        @webtoonQueries1=[]
        @webtoonQueries2=[]
          
        uri = 'https://comic.naver.com/webtoon/weekdayList.nhn?week=tue'
        doc = Nokogiri::HTML(open(uri))
        
        doc.css('.thumb a').each do |r|
          webtoon = Hash.new
          nodeset = r.css('img')
          webtoon['image'] = nodeset.map {|element| element["src"]}.compact.first
          
          @webtoonQueries1 << webtoon
        end  
        doc.css('dl dt').each do |r|
          webtoon = Hash.new
          nodeset = r.css('a')
          webtoon['title'] = nodeset.map {|element| element["title"]}.compact.first
          webtoon['link'] = "https://comic.naver.com" + nodeset.map {|element| element["href"]}.compact.first
          
          @webtoonQueries2 << webtoon
        end
      elsif t.wday == 1
        @webtoonQueries1=[]
        @webtoonQueries2=[]
          
        uri = 'https://comic.naver.com/webtoon/weekdayList.nhn?week=mon'
        doc = Nokogiri::HTML(open(uri))
        
        doc.css('.thumb a').each do |r|
          webtoon = Hash.new
          nodeset = r.css('img')
          webtoon['image'] = nodeset.map {|element| element["src"]}.compact.first
          
          @webtoonQueries1 << webtoon
        end  
        
        doc.css('dl dt').each do |r|
          webtoon = Hash.new
          nodeset = r.css('a')
          webtoon['title'] = nodeset.map {|element| element["title"]}.compact.first
          webtoon['link'] = "https://comic.naver.com" + nodeset.map {|element| element["href"]}.compact.first
          
          @webtoonQueries2 << webtoon
       end
      elsif t.wday == 0
        @webtoonQueries1=[]
        @webtoonQueries2=[]
          
        uri = 'https://comic.naver.com/webtoon/weekdayList.nhn?week=sun'
        doc = Nokogiri::HTML(open(uri))
        
        doc.css('.thumb a').each do |r|
          webtoon = Hash.new
          nodeset = r.css('img')
          webtoon['image'] = nodeset.map {|element| element["src"]}.compact.first
          
        @webtoonQueries1 << webtoon
        end  
        doc.css('dl dt').each do |r|
          webtoon = Hash.new
          nodeset = r.css('a')
          webtoon['title'] = nodeset.map {|element| element["title"]}.compact.first
          webtoon['link'] = "https://comic.naver.com" + nodeset.map {|element| element["href"]}.compact.first
          
          @webtoonQueries << webtoon
       end
      else
        @webtoonQueries1=[]
        @webtoonQueries2=[]
          
        uri = 'https://comic.naver.com/webtoon/weekdayList.nhn?week=sat'
        doc = Nokogiri::HTML(open(uri))
        
        doc.css('.thumb a').each do |r|
          webtoon = Hash.new
          nodeset = r.css('img')
          webtoon['image'] = nodeset.map {|element| element["src"]}.compact.first
          
          @webtoonQueries1 << webtoon
        end  
        doc.css('dl dt').each do |r|
          webtoon = Hash.new
          nodeset = r.css('a')
          webtoon['title'] = nodeset.map {|element| element["title"]}.compact.first
          webtoon['link'] = "https://comic.naver.com" + nodeset.map {|element| element["href"]}.compact.first
          
          @webtoonQueries2 << webtoon
        end
      end
  end
  def new
  end

  def create
    @post = Post.new
    @post.kinds = params[:post_kinds]
    @post.title = params[:post_title]
    @post.content = params[:post_content]
    @post.save
    
    redirect_to '/home/show'
  end
  
  def show
    @post = Post.all
   
end

  def destroy
   post = Post.find(params[:post_id])
   post.destroy
   
    redirect_to '/home/show'
  end
  
  def edit
    @post = Post.find(params[:post_id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @post.title = params[:post_title]
    @post.content = params[:post_content]
    @post.save
    
    redirect_to '/home/show'
  end
end
