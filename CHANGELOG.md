# Tourmaline Changelog

I will do my best to keep this updated with changes as they happen.

## 0.25.1
- Added `sender_type` method and `SenderType` enum to `Message`, allowing the user to easily figure out what type of user or channel sent the given message.
- Updated docs

## 0.25.0
- Removed `Container` class which was being used to maintain a global instance of `Client`.
- Added `finish_init` method to all models, allowing them to contain an instance of the `Client` that created them.

## 0.24.0
- Added full support for Bot API 5.4 and 5.5
- More, see [the official Bot API changelog](https://core.telegram.org/bots/api#december-7-2021) for a complete list of changes.

## 0.23.0

- Added full support for Bot API 5.1 - 5.3
- Fixed some dependencies.
- Added additional classes `ChatInviteLink`, `VoiceChatStarted`, `VoiceChatEnded`, `VoiceChatParticipantInvited`, `VoiceChatScheduled`, `MessageAutoDeleteTimerChanged`, `InputInvoiceMessageContent`, and `BotCommandScope`.
- Added `scope` and `language_code` options to `set_my_commands` and `get_my_commands`.
- Added method `delete_my_commands`.
- More, see [the official Bot API changelog](https://core.telegram.org/bots/api#june-25-2021) for a complete list of changes.

## 0.22.0

- Added support for TDLight.
- Added `user_token` argument to `Client.new` to support the TDLight user API.
- **(breaking change)** All arguments to `Client.new` are now keyword arguments.
- **(breaking change)** Removed `async` argument from event handlers. All events are now async by default. Async events can be disabled with the `-Dno_async` flag.
- `UpdateHandler` now accepts an array of `UpdateAction`, or a single one.
- Fixed an issue where `poll` always deletes a set webhook. Now it will only delete the webhook if `delete_webhook` is true.
## 0.20.0

- **(breaking change)** Removed the filters, replaced with new handlers
- **(breaking change)** Removed Granite specific DB includes from models (also commented out `db_persistence.cr`; next update should make persistence better)
- **(breaking change)** Renamed `PagedInlineKeyboard` to `PagedKeyboard`
- Added `RoutedMenu` class for easy menu building

## 0.19.1

- Replace broken `Int` in unions with `Int::Primitive`
- Make `Helpers.random_string` actually return a random string, not just a number
- Change the first run logic in `Stage`

## 0.19.0

- Added support for `Passport` 
- Added `animated?` to `Sticker`
- Added several new filters including `InlineQueryFilter` and `CallbackQueryFilter`
- Added connection pooling to fix concurrency errors
- Events are now async by default
- Added a new helper class `PagedInlineKeyboard`
- **(breaking change)** Moved KemalAdapter to `tourmaline/extra`
- Added proxy support based on [mamantoha/http_proxy](https://github.com/mamantoha/http_proxy)
- Added support for multiple prefixes with commands
- Allow changing the log level using the `LOG` environment variable
- Added an `InstaBot` example
- **(breaking change)** Disabled (commented out) DBPersistence for now
- Updated for bot API 4.9
  - Added support for the 🏀 emoji, including methods `Client#send_basket`, `Message#reply_with_basket`, and `Message#respond_with_basket`
  - Added `via_bot` field to `Message`
- Added `Stage` (importable from `tourmaline/extra`) for conversation handling

## 0.18.1

- Added ameba checks
- Replaced Halite with `HTTP::Client`, resulting in a major speed boost
- Rename `persistent_init` and `persistent_cleanup` to `init` and `cleanup` respectively
- Remove `handle_error` in favor of `Error.from_code`

## 0.18.0

- Updated polls for Quiz 2.0
- Added new `send_dart` method

## 0.17.0

+ KeyboardMarkup
  - **(breaking change)** Replace `Markup` class with `KeyboardBuilder` abstract class and extend it with   `ReplyKeyboardMarkup::Builder` and `InlineKeyboardMarkup::Builder`.
  - Add `.build` methods to `ReplyKeyboardMarkup` and `InlineKeyboardMarkup`.
  - **(breaking change)** Replace `QueryResultBuilder` with `InlineQueryResult::Builder`.
  - Update examples with new `Builder` classes being used.
+ InlineQueryResult
  - **(breaking change)** Replace `QueryResultBuilder` with `InlineQueryResult::Builder`.
  - Add `.build` method to `InlineQueryResult`.
  - Update examples with new `Builder` classes being used.
+ Persistence
  - **(breaking change)** Made `Persistence` a class rather than a module and updated `HashPersistence`
    and `JsonPersistence` to use it.
  - Add `persistence` instance variable to `Client`
  - Add `NilPersistence` and make it the default persistence for new `Client`s
  - Add `DBPersistence`

## 0.16.0

- Add CHANGELOG
- Add support for Filters.
- Add `users` methods to `Update` and `Message` to return all users included in the same.
- Replaced usage of the `strange` logger with the new Crystal `Log` class.
- Log all updates with `Debug` severity if `VERBOSE` environment variable is set to `true`.
- **(breaking change)** Renamed `File` to `TFile` to avoid conflicting with the builtin `File` class.
- **(breaking change)** removed the `Handler` class and all subclasses. Update handling is now done exclusively with the `EventHandler` class and `Filter`s.

## 0.15.1

- Fix bug with event handler that was causing `On` handlers to run on every update.
- Add CNAME file for tourmaline.dev
- Update the logo.
- Add `DiceBot` example.

## 0.15.0

Updated to bot API 4.7

- Add `send_dice` method to client.
- Add `BotCommand` model along with `get_my_commands` and `set_my_commands` methods.
- Add new sticker/sticker set methods.
- Add `Dice` update action.
