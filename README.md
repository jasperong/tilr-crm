[![Build Status](https://travis-ci.org/jasperong/tilr-crm.svg?branch=master)](https://travis-ci.org/jasperong/tilr-crm)

# Tilr CRM

This is a very simple CRM app created for Tilr's coding challenge.

### Notes

- Rails 5
- Ruby 2.3.1
- [Live link](https://tilr-crm.herokuapp.com)

### Features

- Oauth sign in
- Live seach for contacts (buggy)
- Upload profile photos for contacts
- Sort by name or company
- Tag by favorite, family, friend, or colleague
- Import contacts from gmail, (very buggy, but somehow works)


# TODO

- Make landing page
- Fix front end
- Contact import from Google VERY buggy for now
  - Link to import contacts will fail, but going back to index page will show contacts.. weird..
- Fix first_name and last_name sorting
- For some reason, sorting by name orders contacts in a weird way, however, company sorting works just fine
- Bug: Live Search doesn't work after clicking HOME button, but works on refreshing home page
- (Future) Send email by clicking contact's email address
