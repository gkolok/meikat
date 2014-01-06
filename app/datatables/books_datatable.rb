class BooksDatatable
  delegate :params, :link_to, to: :@view

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
      [
        book.szerzo,
        book.cim,
        book.jelzet,
        book.kiado,
        book.ev,
        if book.kulso_leiras.start_with? 'http' then link_to(book.kulso_leiras,book.kulso_leiras) else book.kulso_leiras end,
      ]
    end
  end

  def books
    @books ||= fetch_books
  end

  def fetch_books
    books = Book.order("#{sort_column} #{sort_direction}")
    books = books.page(page).per_page(per_page)
    if params[:sSearch].present?
    books = books.where("lower(szerzo) like lower(:search) or lower(kiado) like lower(:search) or lower(cim) like lower(:search) or ev like :search or lower(jelzet) like lower(:search) or lower(kulso_leiras) like lower(:search)", search: "%#{params[:sSearch]}%")
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