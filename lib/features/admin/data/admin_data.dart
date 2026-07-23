class UserBeanData {
  final String name;
  final String imageUrl;
  final int beans;

  const UserBeanData({
    required this.name,
    required this.imageUrl,
    required this.beans,
  });
}

final List<UserBeanData> users = const [
  UserBeanData(
    name: 'Mustafa Hussein',
    imageUrl: 'https://i.pravatar.cc/150?img=1',
    beans: 256,
  ),
  UserBeanData(
    name: 'Mustafa Hussein',
    imageUrl: 'https://i.pravatar.cc/150?img=2',
    beans: 256,
  ),
  UserBeanData(
    name: 'Mustafa Hussein',
    imageUrl: 'https://i.pravatar.cc/150?img=3',
    beans: 256,
  ),
  UserBeanData(
    name: 'Mustafa Hussein',
    imageUrl: 'https://i.pravatar.cc/150?img=4',
    beans: 256,
  ),
  UserBeanData(
    name: 'Mustafa Hussein',
    imageUrl: 'https://i.pravatar.cc/150?img=5',
    beans: 256,
  ),
];
