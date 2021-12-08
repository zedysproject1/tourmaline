module Tourmaline
  # # This object represents a Telegram user or bot.
  class User
    include JSON::Serializable
    include Tourmaline::Model

    getter id : Int64

    getter is_bot : Bool

    getter first_name : String

    getter last_name : String?

    getter username : String?

    getter language_code : String?

    getter can_join_groups : Bool?

    getter can_read_all_group_messages : Bool?

    getter supports_inline_queries : Bool?

    # USER API ONLY
    getter? is_verified : Bool?

    # USER API ONLY
    getter? is_scam : Bool?

    def full_name
      [first_name, last_name].compact.join(" ")
    end

    def inline_mention
      name = full_name
      name = name.strip.empty? ? id : name
      "[#{Helpers.escape_md(name)}](tg://user?id=#{id})"
    end

    def profile_photos(offset = nil, limit = nil)
      client.get_user_profile_photos(id, offset, limit)
    end

    def set_game_score(score, **kwargs)
      client.set_game_score(id, score, **kwargs)
    end

    def get_game_high_scores(**kwargs)
      client.get_game_high_scores(id, **kwargs)
    end

    def add_sticker_to_set(name, png_sticker, emojis, mask_position = nil)
      client.add_sticker_to_set(id, name, png_sticker, emojis, mask_position)
    end

    def create_new_sticker_set(name, title, png_sticker, emojis, **kwargs)
      client.create_new_sticker_set(id, name, title, png_sticker, emojis, **kwargs)
    end

    def upload_sticker_file(png_sticker)
      client.upload_sticker_file(id, png_sticker)
    end
  end
end
