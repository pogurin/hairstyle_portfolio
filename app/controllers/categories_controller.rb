class CategoriesController < ApplicationController

  def new
  end
  
  def index
    @categories = Category.all
    @pictures = Picture.all
    agent = Mechanize.new
    page = agent.get('https://tmsportal.collegeoftrades.ca/web/ocot-public-services-v3/public-registry')
    puts("~---------~")
    puts("~PAGE~")
    puts("~---------~")
    puts pp page
    # trade_form = page.form_with(:action => 'colchange.cgi')
    trade_form = page.form_with(:method => 'POST')
    # trade_form = page.field_with(:name => 'd_1332781491534')
    puts("~---------~")
    puts("~TRADE_FORM~")
    puts("~---------~")
    puts pp trade_form
    puts("~---------------------------~")
    puts("~TRADE_FORM : D_1332781491534~")
    puts("~---------------------------~")
    trade_form.d_1332781491534 = '13943954'
    agent.follow_meta_refresh = true
    page = agent.submit(trade_form)
    
    # uri = URI.parse('#page')
    # puts pp Meta.parse("5;url=#{page}", uri)  # => ['5', 'http://example.com/']

  
    puts("~---------~")
    puts("~SEARCH RESULTS~")
    puts("~---------~")
    # puts pp page.at('span:contains("13943954")').next_sibling.text.strip
    # puts pp agent.get(page).search(".//span['13943954']")
    # puts page.search(".repeat tablesorter").at("span:contains('13943954')")
    # agent.get(page) do |x|
    # end
         # pp agent.get(page).search('table.tablesorter').search('tr').search('td').map{ |n| n.text }
         # pp agent.get(page).search('table.tablesorter').search('tr').search('td').map{ |n| n.text }
    # agent.get(page).search("//tr//td[contains(., '13943954')]/td[0]").each do |node|
    #     if ((node.text =~ /\w/))
    #         pp node.text.strip
    #     end
    # end
    pp page.search("//table[@class='tablesorter']//table")
    pp page
    # trade_form = page.form('smartguide')
    # trade_form = page.form('smartguide')
    # # trade_form.field_with(:name => 'd_1332781491534')
    # puts("Here we go")
    # puts(trade_form.field_with(:name => 'd_1332781491534'))
    # # trade_form.d_1332781491534 = 'ruby mechanize'
    # @display = trade_form

  end

  def show
    @category = Category.find(params[:id])
    @pictures = Picture.all
    @pictures_category=[]
    @pictures.each do |picture|
      if picture.categories.find_by_name(@category.name)
        @pictures_category << picture
      end
    end
  end

  def create
  end

  def destroy
  end

  def edit
  end
  
end
