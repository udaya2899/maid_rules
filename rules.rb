Maid.rules do
  watch "/Volumes/NIKON\ Z\ 6\ \ /DCIM/100NCZ_6/" do
    rule 'Organize photos by date' do
      system "terminal-notifier -message '📸 SD Card Backup Initiated' -title 'Maid'"
      where_content_type(dir('/Volumes/NIKON\ Z\ 6\ \ /DCIM/100NCZ_6/**'), ['image', 'video', 'audio']).each do |path|
        creation_time = created_at(path)
        destination = "/Volumes/Pensieve/Udaya/Camera\ Backup/#{creation_time.strftime("%Y")}/#{creation_time.strftime("%Y-%m-%d")}"
        copy(path, mkdir(destination))
      end
      system "terminal-notifier -message ' ✅ SD Card Backup Complete' -title 'Maid'"
    end
  end
end