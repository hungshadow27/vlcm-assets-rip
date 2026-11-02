package com.tgame.manager
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.npc.NpcRes;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.manager.TimerManager;
   
   public class NpcRandomTalkManager
   {
      
      private static var _timerDate:TimerData;
      
      private static var _talkNpcResArr:Array = [];
      
      public function NpcRandomTalkManager()
      {
         super();
      }
      
      public static function add(param1:NpcRes) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(_talkNpcResArr.indexOf(param1) != -1)
         {
            return;
         }
         _talkNpcResArr.push(param1);
         if(_timerDate == null)
         {
            _timerDate = TimerManager.createTimer(30000,0,timerHandle);
         }
      }
      
      public static function removeAll() : void
      {
         _talkNpcResArr.length = 0;
         if(_timerDate != null)
         {
            TimerManager.deleteTimer(_timerDate);
            _timerDate = null;
         }
      }
      
      private static function timerHandle() : void
      {
         var _loc5_:String = null;
         var _loc1_:int = int(_talkNpcResArr.length);
         var _loc2_:int = ZMath.getRandomNumber(0,_talkNpcResArr.length - 1);
         var _loc3_:NpcRes = _talkNpcResArr[_loc2_] as NpcRes;
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(_loc3_.id_kind,SceneCharacterType.NPC);
         if(_loc4_ != null && _loc4_.usable)
         {
            _loc5_ = _loc3_.getOneNpcRandomTalk(GameInstance.mainCharData.attributeInfo.getSex() == 1);
            _loc4_.setHeadFaceTalkText(_loc5_);
         }
         else
         {
            _talkNpcResArr.splice(_loc2_,1);
         }
      }
   }
}

