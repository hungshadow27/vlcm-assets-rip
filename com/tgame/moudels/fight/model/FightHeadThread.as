package com.tgame.moudels.fight.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.MonsterType;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.Player;
   import com.tgame.manager.TSoundManager;
   import com.zcp.common.handler.helper.HandlerHelper;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import com.zcp.manager.TimerManager;
   import flash.geom.Point;
   
   public class FightHeadThread
   {
      
      private var _htDataArr:Array;
      
      private var _td:TimerData;
      
      public function FightHeadThread()
      {
         super();
         this._htDataArr = [];
         this._td = TimerManager.createTimer(400,0,this.timerHandler);
      }
      
      private function timerHandler() : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._htDataArr)
         {
            for each(_loc4_ in _loc1_)
            {
               if(_loc4_[0] == _loc2_[0] && _loc4_[1] == _loc2_[1])
               {
                  _loc3_ = _loc4_;
                  break;
               }
            }
            if(_loc3_ != null)
            {
               _loc3_[2] += _loc2_[2];
            }
            else
            {
               _loc1_.push(_loc2_);
            }
         }
         this._htDataArr.length = 0;
         for each(_loc2_ in _loc1_)
         {
            HandlerHelper.execute(this.showAttackEffect,_loc2_);
         }
      }
      
      public function push(param1:SceneCharacter, param2:String, param3:Number, param4:Boolean = false, param5:Boolean = false, param6:String = "", param7:uint = 0, param8:uint = 0) : void
      {
         if(param5)
         {
            this.showAttackEffect(param1,param2,param3,param4,param6,param7,param8);
         }
         else
         {
            this._htDataArr.push([param1,param2,param3,param4,param6,param7,param8]);
         }
      }
      
      private function showAttackEffect(param1:SceneCharacter, param2:String, param3:Number = 0, param4:Boolean = false, param5:String = "", param6:uint = 0, param7:uint = 0) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:String = null;
         var _loc10_:Player = null;
         var _loc11_:Object = null;
         if(param1 != null)
         {
            if(param1.usable)
            {
               if(param4 && param1.getStatus() != CharStatusType.DEATH && param1.getStatus() != CharStatusType.ATTACK)
               {
                  if(!(param1.data is Monster && ((param1.data as Monster).res.type == MonsterType.BANGQI || (param1.data as Monster).res.type == MonsterType.BAOSHI)))
                  {
                     param1.playTo(CharStatusType.INJURED,-1,-1,new AvatarPlayCondition(true,false,false));
                     _loc8_ = 0;
                     if(param1 != null)
                     {
                        _loc8_ = Point.distance(new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),new Point(param1.piexl_x,param1.piexl_y));
                     }
                     if(param1.type == SceneCharacterType.PLAYER || param1.type == SceneCharacterType.FENSHEN)
                     {
                        _loc10_ = param1.data as Player;
                        if(_loc10_.attributeInfo.getSex() == 1)
                        {
                           TSoundManager.playShortSound_useDis(ResPathManager.SOUND_MAINCHAR_INJURED_1,_loc8_);
                        }
                        else
                        {
                           TSoundManager.playShortSound_useDis(ResPathManager.SOUND_MAINCHAR_INJURED_0,_loc8_);
                        }
                     }
                     else
                     {
                        _loc11_ = param1.data;
                        if(_loc11_.res.id_sound_char_death != 0)
                        {
                           TSoundManager.playShortSound_useDis(_loc11_.res.id_sound_char_injured,_loc8_);
                        }
                        else
                        {
                           TSoundManager.playShortSound_useDis(ResPathManager.SOUND_MAINCHAR_INJURED_0,_loc8_);
                        }
                     }
                  }
                  else
                  {
                     _loc11_ = param1.data;
                     if(_loc11_.res.id_sound_char_death != 0)
                     {
                        TSoundManager.playShortSound_useDis(_loc11_.res.id_sound_char_injured,_loc8_);
                     }
                  }
               }
               param1.showAttackFace(param2,param3,param5,param6,param7);
            }
         }
      }
   }
}

