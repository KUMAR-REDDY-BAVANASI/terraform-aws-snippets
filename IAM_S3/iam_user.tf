# Definations of iam users and groups
resource "aws_iam_user" "user01" {
  name = "user01"
}
resource "aws_iam_user" "user02" {
  name = "user02"
}

resource "aws_iam_group" "developers" {
  name = "developers-group"
}

# Assign users to group
resource "aws_iam_group_membership" "assignment" {
  name = "assignment"
  users = [
    aws_iam_user.user01.name,
    aws_iam_user.user02.name
  ]
  group = aws_iam_group.developers.name
}

# Attach iam policy to the group
resource "aws_iam_policy_attachment" "attachment" {
  name   = "attachment"
  groups = [aws_iam_group.developers.name]
  # The permission plolicy requires you to specify the resource using ARN format
  # arn:partition:service:region:account:service
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}