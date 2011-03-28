package Winged;
use Moose::Role;    # Role!!

# requires 'fly' は、このWinged Roleを使用しているクラスは、
# 必ずflyを実装しなければならないという意味。interfaceみたいな感じ？
requires 'fly'; 

1;
