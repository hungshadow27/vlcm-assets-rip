package com.zcp.engine.graphics.tagger
{
   import com.zcp.common.pool.IPoolClass;
   import com.zcp.engine.Engine;
   import com.zcp.engine.tools.ScenePool;
   import flash.display.Sprite;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class AttackFace extends Sprite implements IPoolClass
   {
      
      public static const ATTACK_CRITICALHIT:String = "ae.aCriticalHit";
      
      public static const ATTACK_CRITICALHIT_FROM_MOUNT:String = "ae.aCriticalHitFromMount";
      
      public static const ATTACK_ZHIMING:String = "ae.aZhiming";
      
      public static const ATTACK_MISS:String = "ae.aMiss";
      
      public static const ATTACK_LOSE:String = "ae.aLose";
      
      public static const ATTACK_LOSE_FROM_MOUNT:String = "ae.aLoseHitFromMount";
      
      public static const ATTACK_JUMPMISS:String = "ae.aJumpMiss";
      
      public static const ATTACK_ANQI_JUMPMISS:String = "ae.ATTACK_ANQI_JUMPMISS";
      
      public static const CHANGE_HP:String = "ae.cHp";
      
      public static const CHANGE_HP_OTHER:String = "ae.cHpOther";
      
      public static const CHANGE_HP_OTHER_FROM_MOUNT:String = "ae.cHpOtherFromMount";
      
      public static const CHANGE_HP_ANQI:String = "ae.CHANGE_HP_ANQI";
      
      public static const LOOK_ME_ANQI:String = "ae.LOOK_ME_ANQI";
      
      public static const LOOK_ME_TANYUNSHOU:String = "ae.LOOK_ME_TANYUNSHOU";
      
      public static const LOOK_ME_YUXIAOJIANFA:String = "ae.LOOK_ME_YUXIAOJIANFA";
      
      public static const LOOK_ME_BOW:String = "ae.LOOK_ME_BOW";
      
      public static const ZUHEJI:String = "ae.ZUHEJI";
      
      public static const CHANGE_MP:String = "ae.cMp";
      
      public static const CHANGE_PP:String = "ae.cPp";
      
      public static const CHANGE_GP:String = "ae.cGp";
      
      public static const CHANGE_EXP:String = "ae.cExp";
      
      public static const CHANGE_PRESTIGE:String = "ae.cPrestige";
      
      public static const CHANGE_ENERGY:String = "ae.cEnergy";
      
      public static const MAX_HP:String = "ae.mHp";
      
      public static const MAX_MP:String = "ae.mMp";
      
      public static const MAX_PP:String = "ae.mPp";
      
      public static const MAX_AP:String = "ae.mAp";
      
      public static const MAX_DP:String = "ae.mDp";
      
      public static const MAX_CP:String = "ae.mCp";
      
      public static const MAX_EV:String = "ae.mEv";
      
      public static const MAX_ADX:String = "ae.mAdx";
      
      public static const MAX_MDX:String = "ae.mMdx";
      
      public static const OTHERS_LEVEL_UP:String = "ae.oLevelUp";
      
      public static const OTHERS_AUTO_SEARCH_PATH:String = "ae.oAutoSearchPath";
      
      public static const OTHERS_AUTO_AFK:String = "ae.oAutoAfk";
      
      public static const OTHERS_TASK_ACCEPT:String = "ae.oTaskAccept";
      
      public static const OTHERS_TASK_HANDIN:String = "ae.oTaskHandIn";
      
      public static const OTHERS_ZHAN_JI:String = "ae.OTHERS_ZHAN_JI";
      
      public static const OTHERS_LIANZHAN:String = "ae.OTHERS_LIANZHAN";
      
      private static const FOUNT_OFFSET:int = 0;
      
      public static const DEFAULT_FOUNT_SIZE_10:int = 10 + FOUNT_OFFSET;
      
      public static const DEFAULT_FOUNT_SIZE_14:int = 14 + FOUNT_OFFSET;
      
      public static const DEFAULT_FOUNT_SIZE_15:int = 15 + FOUNT_OFFSET;
      
      public static const DEFAULT_FOUNT_SIZE_16:int = 16 + FOUNT_OFFSET;
      
      public static const DEFAULT_FOUNT_SIZE_18:int = 18 + FOUNT_OFFSET;
      
      public static const DEFAULT_FOUNT_SIZE_20:int = 20 + FOUNT_OFFSET;
      
      public static const DEFAULT_FOUNT_SIZE_22:int = 22 + FOUNT_OFFSET;
      
      public static const DEFAULT_FOUNT_SIZE_24:int = 24 + FOUNT_OFFSET;
      
      public static const DEFAULT_FOUNT_SIZE_26:int = 26 + FOUNT_OFFSET;
      
      public static const DEFAULT_FOUNT_SIZE_33:int = 33 + FOUNT_OFFSET;
      
      public static const DEFAULT_FOUNT_COLOR_RED:int = 16711680;
      
      public static const DEFAULT_FOUNT_COLOR_BLUE:int = 2003199;
      
      public static const DEFAULT_FOUNT_COLOR_YELLOW:int = 16776960;
      
      public static const DEFAULT_FOUNT_COLOR_GREEN:int = 65280;
      
      public static const DEFAULT_FOUNT_COLOR_PURPLE:int = 10040314;
      
      public static const DEFAULT_FOUNT_COLOR_WHITE:int = 16777215;
      
      public static const DEFAULT_FOUNT_COLOR_ORANGE:int = 16747008;
      
      private static const filterArr:Array = [new GlowFilter(4737096,0.5,4,4,8,BitmapFilterQuality.LOW)];
      
      private static const DEFAULT_FOUNT_SIZE:int = 16;
      
      private var tf:TextField;
      
      private var _type:String = "";
      
      private var _value:Number = 0;
      
      private var _text:String = "";
      
      private var _fontSize:uint = 16;
      
      private var _fontColor:uint = 0;
      
      private var _dir:int = 4;
      
      public function AttackFace(param1:String = "", param2:Number = 0, param3:String = "", param4:uint = 0, param5:uint = 0)
      {
         super();
         this.tf = new TextField();
         this.tf.autoSize = TextFormatAlign.LEFT;
         this.tf.mouseEnabled = false;
         this.tf.filters = filterArr;
         this.reSet([param1,param2,param3,param4,param5]);
      }
      
      public static function createAttackFace(param1:String = "", param2:Number = 0, param3:String = "", param4:uint = 0, param5:uint = 0) : AttackFace
      {
         return ScenePool.attackFacePool.createObj(AttackFace,param1,param2,param3,param4,param5) as AttackFace;
      }
      
      public static function recycleAttackFace(param1:AttackFace) : void
      {
         ScenePool.attackFacePool.disposeObj(param1);
      }
      
      public function get dir() : int
      {
         return this._dir;
      }
      
      public function dispose() : void
      {
         this._type = "";
         this._value = 0;
         this._text = "";
         this._fontSize = DEFAULT_FOUNT_SIZE;
         this._fontColor = 0;
         this._dir = 4;
      }
      
      public function reSet(param1:Array) : void
      {
         this._type = param1[0];
         this._value = param1[1];
         var _loc2_:String = param1[2];
         var _loc3_:uint = uint(param1[3]);
         var _loc4_:uint = uint(param1[4]);
         var _loc5_:String = "";
         switch(this._type)
         {
            case ATTACK_CRITICALHIT:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_22;
               this._fontColor = DEFAULT_FOUNT_COLOR_RED;
               break;
            case ATTACK_CRITICALHIT_FROM_MOUNT:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_22;
               this._fontColor = DEFAULT_FOUNT_COLOR_RED;
               break;
            case ATTACK_ZHIMING:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_22;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case ATTACK_MISS:
               this._fontSize = DEFAULT_FOUNT_SIZE_18;
               this._fontColor = DEFAULT_FOUNT_COLOR_GREEN;
               this._dir = 2;
               break;
            case ATTACK_LOSE:
               this._fontSize = DEFAULT_FOUNT_SIZE_18;
               this._fontColor = DEFAULT_FOUNT_COLOR_BLUE;
               this._dir = 6;
               break;
            case ATTACK_LOSE_FROM_MOUNT:
               this._fontSize = DEFAULT_FOUNT_SIZE_15;
               this._fontColor = DEFAULT_FOUNT_COLOR_BLUE;
               this._dir = 6;
               break;
            case ATTACK_JUMPMISS:
               this._fontSize = DEFAULT_FOUNT_SIZE_18;
               this._fontColor = DEFAULT_FOUNT_COLOR_GREEN;
               this._dir = 2;
               break;
            case ATTACK_ANQI_JUMPMISS:
               this._fontSize = DEFAULT_FOUNT_SIZE_15;
               this._fontColor = DEFAULT_FOUNT_COLOR_RED;
               this._dir = 2;
               break;
            case LOOK_ME_ANQI:
               this._fontSize = DEFAULT_FOUNT_SIZE_15;
               this._fontColor = DEFAULT_FOUNT_COLOR_RED;
               this._dir = 2;
               break;
            case LOOK_ME_TANYUNSHOU:
               this._fontSize = DEFAULT_FOUNT_SIZE_15;
               this._fontColor = DEFAULT_FOUNT_COLOR_RED;
               this._dir = 2;
               break;
            case LOOK_ME_YUXIAOJIANFA:
               this._fontSize = DEFAULT_FOUNT_SIZE_15;
               this._fontColor = DEFAULT_FOUNT_COLOR_PURPLE;
               this._dir = 2;
               break;
            case LOOK_ME_BOW:
               this._fontSize = DEFAULT_FOUNT_SIZE_15;
               this._fontColor = DEFAULT_FOUNT_COLOR_RED;
               this._dir = 6;
               break;
            case ZUHEJI:
               this._fontSize = DEFAULT_FOUNT_SIZE_15;
               this._fontColor = DEFAULT_FOUNT_COLOR_GREEN;
               this._dir = 2;
               break;
            case CHANGE_HP:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = String(this._value);
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_RED;
               break;
            case CHANGE_HP_OTHER:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = String(this._value);
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_WHITE;
               break;
            case CHANGE_HP_OTHER_FROM_MOUNT:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = String(this._value);
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_10;
               this._fontColor = DEFAULT_FOUNT_COLOR_WHITE;
               break;
            case CHANGE_HP_ANQI:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + String(this._value);
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_14;
               this._fontColor = DEFAULT_FOUNT_COLOR_ORANGE;
               break;
            case CHANGE_MP:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = String(this._value);
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_14;
               this._fontColor = DEFAULT_FOUNT_COLOR_BLUE;
               break;
            case CHANGE_PP:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = String(this._value);
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_14;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case CHANGE_GP:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_PURPLE;
               break;
            case CHANGE_EXP:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case CHANGE_PRESTIGE:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_PURPLE;
               break;
            case CHANGE_ENERGY:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = String(this._value);
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_10;
               this._fontColor = DEFAULT_FOUNT_COLOR_GREEN;
               break;
            case MAX_HP:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_RED;
               break;
            case MAX_MP:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_BLUE;
               break;
            case MAX_PP:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case MAX_AP:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case MAX_DP:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case MAX_CP:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case MAX_EV:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case MAX_ADX:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_GREEN;
               break;
            case MAX_MDX:
               if(this._value > 0)
               {
                  _loc5_ = " +" + this._value;
               }
               else
               {
                  _loc5_ = " " + this._value;
               }
               this._fontSize = DEFAULT_FOUNT_SIZE_16;
               this._fontColor = DEFAULT_FOUNT_COLOR_GREEN;
               break;
            case OTHERS_LEVEL_UP:
               this._fontSize = DEFAULT_FOUNT_SIZE_33;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case OTHERS_AUTO_SEARCH_PATH:
               this._fontSize = DEFAULT_FOUNT_SIZE_33;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case OTHERS_AUTO_AFK:
               this._fontSize = DEFAULT_FOUNT_SIZE_33;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case OTHERS_TASK_ACCEPT:
               this._fontSize = DEFAULT_FOUNT_SIZE_33;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case OTHERS_TASK_HANDIN:
               this._fontSize = DEFAULT_FOUNT_SIZE_33;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case OTHERS_ZHAN_JI:
               this._fontSize = DEFAULT_FOUNT_SIZE_33;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
               break;
            case OTHERS_LIANZHAN:
               this._fontSize = DEFAULT_FOUNT_SIZE_33;
               this._fontColor = DEFAULT_FOUNT_COLOR_YELLOW;
         }
         this._text = _loc2_ + _loc5_;
         if(_loc3_ != 0)
         {
            this._fontSize = _loc3_;
         }
         if(_loc4_ != 0)
         {
            this._fontColor = _loc4_;
         }
         if(this._text != "")
         {
            this.tf.text = this._text;
            this.tf.setTextFormat(new TextFormat(Engine.font_AttackFace,this._fontSize,this._fontColor));
            this.tf.x = -this.tf.width / 2;
            this.tf.y = -this.tf.height / 2;
            if(this.tf.parent != this)
            {
               this.addChild(this.tf);
            }
         }
         else
         {
            this.tf.text = "";
         }
      }
   }
}

