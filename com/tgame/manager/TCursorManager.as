package com.tgame.manager
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.BaseItem;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   
   public class TCursorManager
   {
      
      public static var chickItemToPanelFun:Function;
      
      private static var _currentItemFace:ItemFace;
      
      public static var currentBaseItem:BaseItem;
      
      public static var source:int;
      
      public static var cursorBmp:Bitmap;
      
      private static var cursorPosition:int;
      
      public static var mapTile:MapTile;
      
      public static const CURSOR_BUZHUO:String = "buzhuo";
      
      public static const CURSOR_CAIJI:String = "caiji";
      
      public static const CURSOR_CKTW:String = "chakantanwei";
      
      public static const CURSOR_CUNRU:String = "cunru";
      
      public static const CURSOR_DUIHUA:String = "duihua";
      
      public static const CURSOR_GONGJI:String = "gongji";
      
      public static const CURSOR_GOUMAI:String = "goumai";
      
      public static const CURSOR_MAICHU:String = "maichu";
      
      public static const CURSOR_MOREN:String = "moren";
      
      public static const CURSOR_QUCHU:String = "quchu";
      
      public static const CURSOR_SHANGJIA:String = "shangjia";
      
      public static const CURSOR_TIAOYUE:String = "tiaoyue";
      
      public static const CURSOR_XIAJIA:String = "xiajia";
      
      public static const CURSOR_XUNLU:String = "xunlu";
      
      public static const CURSOR_DESTROY:String = "xiaohui";
      
      public static const CURSOR_DOLL_EMPTY:String = "chongqiwawakong";
      
      public static const CURSOR_DOLL_FULL:String = "chongqiwawaman";
      
      public static const CURSOR_DOLL_SUPER_FULL:String = "chongqiwawamansuper";
      
      public static const CURSOR_MOXUEDOLL_EMPTY:String = "chongqiwawakong";
      
      public static const CURSOR_MOXUEDOLL_FULL:String = "chongqiwawaman";
      
      public static const CURSOR_XUEYIN:String = "chongqiwawamansuper";
      
      public static const CURSOR_WABAOL:String = "wabao";
      
      public static const CURSOR_SHOUXING:String = "wupinhecheng";
      
      public static const CURSOR_XUANZELINGPAI:String = "xuanzelingpai";
      
      public static const CURSOR_PLCQ:String = "piliangcunqu";
      
      public static const CURSOR_PLCQ_KUAFU:String = "CURSOR_PLCQ_KUAFU";
      
      public static const CURSOR_XUANZEHUA:String = "xuanzehua";
      
      public static const CURSOR_SHANGJIA_WJJJY:String = "shangjia_wanjiajianjiaoyi";
      
      public static const CURSOR_MOVING:String = "tuziliwu";
      
      public static const CURSOR_ITEM:String = "CURSOR_ITEM";
      
      public static const SELETE_ITEM_ON_OTHER_PANEL:String = "SELETE_ITEM_ON_OTHER_PANEL";
      
      public static const CURSOR_USE:String = "CURSOR_USE";
      
      public static const CURSOR_MOVE:String = "CURSOR_MOVE";
      
      public static const CURSOR_DRAG:String = "CURSOR_DRAG";
      
      public static const CURSOR_FLOOR_ATTACK:String = "diandigongji";
      
      public static const CURSOR_SELECT_YUPEI:String = "CURSOR_SELECT_YUPEI";
      
      public static const CURSOR_SELECT_YUPEI_SWITCH:String = "CURSOR_SELECT_YUPEI_SWITCH";
      
      public static const CURSOR_CHI_HUNYAN:String = "CURSOR_CHI_HUNYAN";
      
      private static var CURRUNT_STATUS:String = "";
      
      private static var isLockOn:Boolean = false;
      
      public function TCursorManager()
      {
         super();
         throw new Error("can not new this static class!");
      }
      
      public static function init() : void
      {
         GameInstance.stage.addEventListener(Event.ADDED,onAddedToStage);
         GameInstance.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
      }
      
      private static function onMouseUp(param1:MouseEvent) : void
      {
         if(getCurruntStatus() == CURSOR_DRAG)
         {
            resumFullMouse();
         }
      }
      
      public static function showCursor(param1:String = "moren", param2:Boolean = false) : void
      {
         if(!param2)
         {
            if(isLockOn || param1 == CURRUNT_STATUS || CURRUNT_STATUS == CURSOR_ITEM || CURRUNT_STATUS == SELETE_ITEM_ON_OTHER_PANEL)
            {
               return;
            }
         }
         if(param1 == CURSOR_MOREN)
         {
            resumMouse();
            CURRUNT_STATUS = param1;
            return;
         }
         var _loc3_:BitmapData = RslLoaderManager.getInstance("ui.mouse." + param1,30,30);
         if(_loc3_ != null)
         {
            Mouse.hide();
            if(cursorBmp == null)
            {
               cursorBmp = new Bitmap(_loc3_);
            }
            else
            {
               cursorBmp.bitmapData = _loc3_;
            }
            GameInstance.stage.addChild(cursorBmp);
         }
         else
         {
            Mouse.show();
         }
         CURRUNT_STATUS = param1;
         cursorPosition = 1;
         GameInstance.stage.addEventListener(Event.ENTER_FRAME,onFrameEnter);
      }
      
      private static function onAddedToStage(param1:Event) : void
      {
         if(!cursorBmp || !cursorBmp.parent)
         {
            return;
         }
         cursorBmp.parent.setChildIndex(cursorBmp,cursorBmp.parent.numChildren - 1);
      }
      
      public static function set currentItemFace(param1:ItemFace) : void
      {
         _currentItemFace = param1;
      }
      
      public static function get currentItemFace() : ItemFace
      {
         return _currentItemFace;
      }
      
      private static function onFrameEnter(param1:Event) : void
      {
         if(cursorBmp == null)
         {
            return;
         }
         if(cursorPosition == 1)
         {
            cursorBmp.x = GameInstance.stage.mouseX;
            cursorBmp.y = GameInstance.stage.mouseY;
         }
         else if(cursorPosition == 2)
         {
            cursorBmp.x = GameInstance.stage.mouseX - cursorBmp.width * 0.5;
            cursorBmp.y = GameInstance.stage.mouseY - cursorBmp.height * 0.5;
         }
      }
      
      public static function resumMouse() : void
      {
         if(isLockOn)
         {
            return;
         }
         CURRUNT_STATUS = CURSOR_MOREN;
         GameInstance.stage.removeEventListener(Event.ENTER_FRAME,onFrameEnter);
         Mouse.show();
         if(Boolean(cursorBmp) && Boolean(cursorBmp.bitmapData))
         {
            GameInstance.stage.removeChild(cursorBmp);
            cursorBmp.bitmapData.dispose();
            cursorBmp.bitmapData = null;
            cursorBmp = null;
         }
      }
      
      public static function resumFullMouse() : void
      {
         KeyboardManager.tiaoyue_down = false;
         removeLockOnMouseStatus();
         CURRUNT_STATUS = CURSOR_MOREN;
         GameInstance.stage.removeEventListener(Event.ENTER_FRAME,onFrameEnter);
         Mouse.show();
         if(Boolean(cursorBmp) && Boolean(cursorBmp.bitmapData) && Boolean(cursorBmp.parent))
         {
            cursorBmp.parent.removeChild(cursorBmp);
            cursorBmp.bitmapData.dispose();
            cursorBmp.bitmapData = null;
            cursorBmp = null;
         }
         currentItemFace = null;
      }
      
      public static function mouseToNormal() : void
      {
         Mouse.show();
         if(Boolean(cursorBmp) && Boolean(cursorBmp.bitmapData))
         {
            GameInstance.stage.removeChild(cursorBmp);
            cursorBmp.bitmapData.dispose();
            cursorBmp.bitmapData = null;
            cursorBmp = null;
         }
      }
      
      public static function showItem(param1:BitmapData) : void
      {
         var _loc2_:BitmapData = null;
         cursorPosition = 2;
         if(param1 != null)
         {
            Mouse.hide();
            _loc2_ = param1.clone();
            if(cursorBmp == null)
            {
               cursorBmp = new Bitmap(_loc2_);
            }
            else
            {
               cursorBmp.bitmapData = _loc2_;
            }
            GameInstance.stage.addChild(cursorBmp);
         }
         else
         {
            Mouse.show();
         }
         GameInstance.stage.addEventListener(Event.ENTER_FRAME,onFrameEnter);
      }
      
      public static function lockOnMouseStatus() : void
      {
         isLockOn = true;
      }
      
      public static function removeLockOnMouseStatus() : void
      {
         isLockOn = false;
      }
      
      public static function getLockOnMouseStatus() : Boolean
      {
         return isLockOn;
      }
      
      public static function seleteItemOnOtherPanel() : void
      {
         CURRUNT_STATUS = SELETE_ITEM_ON_OTHER_PANEL;
      }
      
      public static function getCurruntStatus() : String
      {
         return CURRUNT_STATUS;
      }
      
      public static function setCurrentStatus(param1:String) : void
      {
         CURRUNT_STATUS = param1;
      }
   }
}

