resource "aws_instance" "expense" {
  for_each = lookup(var.servers, terraform.workspace)

  ami                    = data.aws_ami.devops-practice_ami.id
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.expense.id]

  tags = merge(
    local.common_tags, { Name = each.key }
  )
}