

abstract class gameEntity
{
  late final int entityHealth;
  late final String spritePath;
  late final String nameEntity;
  late final int hitPower;
  late final bool isActive;
  gameEntity(this.entityHealth,this.spritePath,this.nameEntity,this.hitPower,this.isActive);
  void haveDamage(int power);
  int makeDamage();
  void changeState(bool state);

}