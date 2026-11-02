package com.tgame.manager
{
   import com.fireice.alert.FAlert;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.display.Bitmap;
   
   public class NoticeManager
   {
      
      public static var myMsgFun:Function;
      
      public static var addedToConcernMsgPanelFun:Function;
      
      public static const ALERT:int = 1;
      
      public static const SYSTEM_CHAT:int = 2;
      
      public static const SYSTEM_RIGHT:int = 3;
      
      public static const SYSTEM_ROLL:int = 4;
      
      public static const SYSTEM_SWITCH:int = 6;
      
      public static const FOOT:int = 5;
      
      public static const CENTER:int = 7;
      
      public static const CENTER_UP:int = 8;
      
      public static const CENTER_BITMAP:int = 9;
      
      public static const GUAIWU_SHUOHUA:int = 11;
      
      public function NoticeManager()
      {
         super();
      }
      
      public static function notify(param1:int, param2:String, param3:Boolean = true, param4:String = "", param5:Bitmap = null, param6:int = 0) : void
      {
         var _loc7_:String = null;
         if(param3)
         {
            _loc7_ = LanResManager.getLanCommonTextWords(param2);
            if(_loc7_ != "")
            {
               param2 = _loc7_;
            }
         }
         switch(param1)
         {
            case SYSTEM_CHAT:
               GameInstance.uiInstance.mainUI.receiveMessage(1,"",-100,"",-1,param2);
               break;
            case SYSTEM_RIGHT:
               GameInstance.uiInstance.mainUI.setSysTip(param2);
               if(myMsgFun != null)
               {
                  myMsgFun(param2);
               }
               break;
            case FOOT:
               if(GameState.enableTishiMsg)
               {
                  TopTipManager.getInstance().addCharFootTip(param2);
               }
               break;
            case SYSTEM_ROLL:
               GameInstance.uiInstance.mainUI.receiveMessage(1,LanResManager.getLanCommonTextWords("公告"),-100,"",-1,param2);
               TopTipManager.getInstance().addSystemRollTip(param2);
               if(addedToConcernMsgPanelFun != null)
               {
                  addedToConcernMsgPanelFun(param2,param4);
               }
               break;
            case SYSTEM_SWITCH:
               TopTipManager.getInstance().addSystemSwitchTip(param2);
               break;
            case CENTER:
               TopTipManager.getInstance().addCenterTip(param2);
               break;
            case ALERT:
               if(param2.indexOf("</font>") == -1)
               {
                  param2 = "<font color=\'#FFFFFF\'>" + param2 + "</font>";
               }
               FAlert.show(param2);
               break;
            case CENTER_UP:
               TopTipManager.getInstance().addCenterUpTip(param2);
               break;
            case CENTER_BITMAP:
               TopTipManager.getInstance().addCenterTip("-1",param5,param6);
         }
      }
      
      public static function guaiwuShuohua(param1:int, param2:String) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param1,SceneCharacterType.MONSTER);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.setHeadFaceTalkText(param2,StaticValue.GREEN);
      }
   }
}

