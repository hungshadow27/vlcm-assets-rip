package com.tgame.manager
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.common.staticdata.QuickBtn;
   import com.tgame.common.staticdata.SettingKey;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.shell.view.components.NpcDialogPanel;
   import com.tgame.shell.view.components.mainui.ImageLeadCanvas;
   import com.zcp.common.handler.helper.HandlerHelper;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   
   public class KeyboardManager
   {
      
      public static var _keyArr:Array;
      
      public static var _ctrl_keyArr:Array;
      
      public static var shift_down:Boolean = false;
      
      public static var ctrl_down:Boolean = false;
      
      public static var enable:Boolean = false;
      
      public static var zunrongEnable:Boolean = false;
      
      public static var tiaoyue_down:Boolean = false;
      
      public function KeyboardManager()
      {
         super();
      }
      
      public static function init() : void
      {
         initArr();
         GameInstance.stage.addEventListener(Event.DEACTIVATE,deacttiveHandle,false,int.MAX_VALUE);
         GameInstance.stage.addEventListener(KeyboardEvent.KEY_DOWN,keyboardDownHandle,false,int.MAX_VALUE);
         GameInstance.stage.addEventListener(KeyboardEvent.KEY_UP,keyboardUpHandle,false,int.MAX_VALUE);
         GameInstance.stage.addEventListener(Event.REMOVED,removedHandle,false,int.MAX_VALUE);
      }
      
      private static function removedHandle(param1:Event) : void
      {
         if(param1.target == GameInstance.stage.focus || Fun.isParentChild(param1.target as DisplayObjectContainer,GameInstance.stage.focus))
         {
            GameInstance.stage.focus = null;
         }
      }
      
      private static function deacttiveHandle(param1:Event) : void
      {
         shift_down = false;
         ctrl_down = false;
      }
      
      private static function keyboardDownHandle(param1:KeyboardEvent) : void
      {
         shift_down = param1.shiftKey;
         ctrl_down = param1.ctrlKey;
      }
      
      private static function keyboardUpHandle(param1:KeyboardEvent) : void
      {
         var _loc3_:Array = null;
         var _loc6_:* = 0;
         var _loc7_:Object = null;
         var _loc8_:FPanel = null;
         shift_down = param1.shiftKey;
         ctrl_down = param1.ctrlKey;
         if(!enable)
         {
            return;
         }
         if(GameInstance.stage.focus is TextField && (GameInstance.stage.focus as TextField).type == TextFieldType.INPUT)
         {
            return;
         }
         var _loc2_:uint = param1.keyCode;
         if(_ctrl_keyArr.length == 0 || _keyArr.length == 0)
         {
            initArr();
         }
         if(ctrl_down)
         {
            _loc3_ = _ctrl_keyArr;
         }
         else
         {
            _loc3_ = _keyArr;
         }
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(_loc2_ == _loc3_[_loc5_][0])
            {
               if(_loc3_[_loc5_][0] == Keyboard.ESCAPE)
               {
                  if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
                  {
                     _loc6_ = int(GameInstance.uiInstance.uiContainer.numChildren - 1);
                     while(_loc6_ >= 0)
                     {
                        _loc7_ = GameInstance.uiInstance.uiContainer.getChildAt(_loc6_);
                        if(_loc7_ is FPanel)
                        {
                           _loc8_ = _loc7_ as FPanel;
                           if(_loc8_ != GameInstance.uiInstance._cardGiftPanel)
                           {
                              _loc8_.dispatchEvent(new FCloseEvent(FCloseEvent.CLOSE,null));
                           }
                           break;
                        }
                        if(_loc7_ is BasePanel)
                        {
                           (_loc7_ as BasePanel).onClose();
                           break;
                        }
                        if(_loc7_ is NpcDialogPanel)
                        {
                           PipeManager.sendMsg(PipeConstants.HIDE_NPC_DIALOG_PLANE);
                           break;
                        }
                        if(GameInstance.uiInstance.mainUI.imageLeadContainer.numChildren > 0)
                        {
                           _loc7_ = GameInstance.uiInstance.mainUI.imageLeadContainer.getChildAt(GameInstance.uiInstance.mainUI.imageLeadContainer.numChildren - 1);
                           if(_loc7_ is ImageLeadCanvas)
                           {
                              (_loc7_ as ImageLeadCanvas).onClose();
                              break;
                           }
                        }
                        _loc6_--;
                     }
                  }
               }
               if(_loc3_[_loc5_][1] is Function)
               {
                  HandlerHelper.execute(_loc3_[_loc5_][1]);
               }
               else
               {
                  PipeManager.sendMsg(_loc3_[_loc5_][1],param1);
               }
               if(_loc3_[_loc5_][0] == PipeConstants.SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE)
               {
                  NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide5);
               }
               return;
            }
            _loc5_++;
         }
      }
      
      private static function initArr() : void
      {
         if(zunrongEnable)
         {
            _ctrl_keyArr = [[0,""]];
            _keyArr = [[QuickBtn.B_INT_1,PipeConstants.KEY_1],[QuickBtn.B_INT_2,PipeConstants.KEY_2],[QuickBtn.B_INT_3,PipeConstants.KEY_3],[QuickBtn.B,PipeConstants.SHOW_MAINCHAR_BACKPACK],[QuickBtn.BO,PipeConstants.TAB_SELECT]];
            return;
         }
         _ctrl_keyArr = [[QuickBtn.Y,function():void
         {
            PipeManager.sendMsg(PipeConstants.SETTING_DATA,[SettingKey.K7,!TSoundManager.getShortSoundMute()]);
         }],[QuickBtn.Z,PipeConstants.SHOW_AFK_PANEL],[QuickBtn.B_INT_1,PipeConstants.CTRL_KEY_1],[QuickBtn.B_INT_2,PipeConstants.CTRL_KEY_2],[QuickBtn.B_INT_3,PipeConstants.CTRL_KEY_3],[QuickBtn.B_INT_4,PipeConstants.CTRL_KEY_4],[QuickBtn.B_INT_5,PipeConstants.CTRL_KEY_5],[QuickBtn.X,function():void
         {
            PipeManager.sendMsg(PipeConstants.USE_SKILL_BIYISHUANGFEI);
         }],[QuickBtn.BO,""]];
         _keyArr = [[QuickBtn.A,PipeConstants.SHOW_BIGUAN_PANEL],[QuickBtn.B,PipeConstants.SHOW_MAINCHAR_BACKPACK],[QuickBtn.C,PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE],[QuickBtn.D,PipeConstants.SHOW_CHENGJIU_PANEL],[QuickBtn.E,function():void
         {
            PipeManager.sendMsg(PipeConstants.SETTING_DATA,[SettingKey.K0,GameInstance.scene.getCharAvatarVisible(SceneCharacterType.PLAYER)]);
         }],[QuickBtn.F,PipeConstants.SHOW_FRIEND_PLANE],[QuickBtn.G,function():void
         {
            if(GameInstance.mainCharData.banghuiInfo.banghuiId > 0)
            {
               GameInstance.lookBanghuiID = GameInstance.mainCharData.banghuiInfo.banghuiId;
               PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_INFO_PANEL);
            }
            else
            {
               PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_LIST_PANEL);
            }
         }],[QuickBtn.I,function():void
         {
            PipeManager.sendMsg(PipeConstants.SETTING_DATA,[SettingKey.K1,GameInstance.scene.getCharHeadVisible(SceneCharacterType.PLAYER)]);
         }],[QuickBtn.J,""],[QuickBtn.K,PipeConstants.SHOW_RANK_PLANE],[QuickBtn.M,PipeConstants.SHOW_MAP],[QuickBtn.N,PipeConstants.SHOW_MAINCHAR_RIDEBTN_PLANE],[QuickBtn.O,PipeConstants.SHOW_MALL_PLANE],[QuickBtn.P,PipeConstants.UP_DOWN_FEIXING],[QuickBtn.Q,PipeConstants.SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE],[QuickBtn.R,PipeConstants.CHANGE_CHAT_SIZE],[QuickBtn.S,PipeConstants.SHOW_SETTINGS_PANEL_TAB],[QuickBtn.T,PipeConstants.SHOW_MAINCHAR_TEAM_ATTRIBUTE_PLANE],[QuickBtn.V,PipeConstants.SHOW_MAINCHAR_KUNGFU],[QuickBtn.W,PipeConstants.UP_DOWN_HORSE],[QuickBtn.X,PipeConstants.SEND_DAZUO],[QuickBtn.Y,function():void
         {
            PipeManager.sendMsg(PipeConstants.SETTING_DATA,[SettingKey.K6,!TSoundManager.getBgSoundMute()]);
         }],[QuickBtn.Z,function():void
         {
            if(GameInstance.mainCharData.afkInfo2.isStart)
            {
               PipeManager.sendMsg(PipeConstants.AFK_START,0);
            }
            else
            {
               PipeManager.sendMsg(PipeConstants.AFK_START,1);
            }
         }],[QuickBtn.B_INT_0,PipeConstants.KEY_0],[QuickBtn.B_INT_1,PipeConstants.KEY_1],[QuickBtn.B_INT_2,PipeConstants.KEY_2],[QuickBtn.B_INT_3,PipeConstants.KEY_3],[QuickBtn.B_INT_4,PipeConstants.KEY_4],[QuickBtn.B_INT_5,PipeConstants.KEY_5],[QuickBtn.B_INT_6,PipeConstants.KEY_6],[QuickBtn.B_INT_7,PipeConstants.KEY_7],[QuickBtn.B_INT_8,PipeConstants.KEY_8],[QuickBtn.B_INT_9,PipeConstants.KEY_9],[Keyboard.ESCAPE,PipeConstants.KEY_ESC],[Keyboard.SPACE,PipeConstants.KEY_SPACE],[QuickBtn.BO,PipeConstants.TAB_SELECT]];
      }
   }
}

