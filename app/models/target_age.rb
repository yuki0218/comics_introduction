class TargetAge < ActiveHash::Base
  self.data = [
    {id: 0, name: '---'},
    {id: 1, name: '幼年漫画'},
    {id: 2, name: '少年漫画'},
    {id: 3, name: '少女漫画'},
    {id: 4, name: '青年漫画'},
    {id: 5, name: '女性漫画'},
    {id: 6, name: '成人向け漫画'}
  ]

  include ActiveHash::Associations
  has_many :comics

end