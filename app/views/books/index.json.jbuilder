json.array!(@books) do |book|
  json.extract! book, :id, :szerzo, :cim, :jelzet, :kiado, :ev, :targyszavak, :kulso_leiras
  json.url book_url(book, format: :json)
end
