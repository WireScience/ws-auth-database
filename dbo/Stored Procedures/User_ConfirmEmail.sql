create procedure dbo.User_ConfirmEmail
(
  @email  nvarchar(256)
)
as
begin

  update dbo.AspNetUsers
  set
    EmailConfirmed = 1
  where
    Email = @email

  return 0;

end