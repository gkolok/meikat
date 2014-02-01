class BooksDatatable
  delegate :params, :link_to, :edit_book_path, :image_tag, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Book.count,
      iTotalDisplayRecords: books.total_entries,
      aaData: data
    }
  end

private

  def data
    books.map do |book|
      d = [
        book.szerzo,
        book.cim,
        book.jelzet,
        book.kiado,
        book.ev,
        if (book.kulso_leiras && book.kulso_leiras.start_with?('http')) 
          then link_to('leírás',book.kulso_leiras) 
          else book.kulso_leiras 
        end,
        if book.allapot == :kolcsonozve.to_s
          then 
            book.lendings.last.lender
          else ''
        end

      ]
      if @view.user_is_admin?
        d = d + [
          link_to(image_tag('edit.png'), edit_book_path(book)),
          link_to(image_tag('delete.png'), book, method: :delete, data: { confirm: 'Biztos, hogy törölni akarod?' }),
        ]  
      end
      d
    end
  end

  def books
    @books ||= fetch_books
  end

  def fetch_books
    books = Book.order("#{sort_column} #{sort_direction}")
    books = books.page(page).per_page(per_page)
  
    if params[:sSearch].present?
      cols = %w[szerzo cim jelzet kiado ev]
      keys = params[:sSearch].downcase.split.map { |k|  "%#{k}%"}
      where = (1..keys.size).map{|i| cols.map {|c| "lower(#{c}) like :s#{i}"}.join ' or '}.map{|term| "(#{term})"}.join ' and '
      param_map = {}
      keys.each_index {|i| param_map["s#{i+1}".to_sym] = keys[i]}
      books = books.where(where, param_map)
    end
    books
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[szerzo cim jelzet kiado ev kulso_leiras]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end