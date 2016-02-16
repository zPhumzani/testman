json.array!(@profiles) do |profile|
  json.extract! profile, :id, :date_of_birth, :location, :languages, :bio, :favorite_qoutes, :interest, :favorite_movies, :favorite_music, :title
  json.url profile_url(profile, format: :json)
end
