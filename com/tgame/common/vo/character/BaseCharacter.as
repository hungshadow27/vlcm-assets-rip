package com.tgame.common.vo.character
{
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.character.info.BuffInfo;
   import com.zcp.engine.SceneCharacter;
   
   public class BaseCharacter
   {
      
      public var sceneCharacter:SceneCharacter;
      
      private var _avatarInfo:AvatarInfo;
      
      private var _buffInfo:BuffInfo;
      
      public var isInProtect:Boolean;
      
      public var isInKanqi:Boolean;
      
      public var isInHuqi:Boolean;
      
      public var isShouhu:Boolean;
      
      public var isFixed:Boolean;
      
      public var isSoft:Boolean;
      
      public var isInDrink:Boolean;
      
      public var isSleep:Boolean;
      
      public var isBlind:Boolean;
      
      public var isDarken:Boolean;
      
      public var isJiuyinshenzhua:Boolean;
      
      public var isXueDao:Boolean;
      
      public var isDuoMingShiSanJian:Boolean;
      
      public var isXiangLongAoYi:Boolean;
      
      public var isInAutoFly:Boolean;
      
      public var isGirlSucc:Boolean;
      
      public var isBind:Boolean = false;
      
      public var isWeiZhenShanHe:Boolean = false;
      
      public var isShuFuJuZhen:Boolean = false;
      
      public var isBuNengXuanRen:Boolean = false;
      
      public var isShuShenShu:Boolean = false;
      
      public var shuangxiu_oldX:Number = 0;
      
      public var shuangxiu_oldY:Number = 0;
      
      public var isQiongLongShenYu:Boolean = false;
      
      public var isStop:Boolean;
      
      public var moveSpeed:Number;
      
      public function BaseCharacter(param1:SceneCharacter)
      {
         super();
         this.sceneCharacter = param1;
      }
      
      public function get avatarInfo() : AvatarInfo
      {
         if(this._avatarInfo == null)
         {
            this._avatarInfo = new AvatarInfo();
         }
         return this._avatarInfo;
      }
      
      public function set avatarInfo(param1:AvatarInfo) : void
      {
         if(!param1)
         {
            return;
         }
         if(this._avatarInfo)
         {
            this._avatarInfo.clear();
            this._avatarInfo = null;
         }
         this._avatarInfo = param1.clone();
      }
      
      public function get buffInfo() : BuffInfo
      {
         if(this._buffInfo == null)
         {
            this._buffInfo = new BuffInfo();
         }
         return this._buffInfo;
      }
   }
}

