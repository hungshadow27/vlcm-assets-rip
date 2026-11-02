package
{
   import com.fireice.util.UITools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.QuickBtn;
   import com.zcp.common.drag.vo.DragData;
   import com.zcp.common.draw.helper.DrawHelper;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.vo.StyleData;
   import com.zcp.manager.DragManager;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.ui.Keyboard;
   
   public class TLog
   {
      
      private static var updateLoadXMLLogText:TextField;
      
      private static var useUpdateLoadXMLLog:Boolean = false;
      
      public static var log_loadList:String = "";
      
      public function TLog()
      {
         super();
      }
      
      private static function enableUpdateLoadXMLLog() : void
      {
         useUpdateLoadXMLLog = true;
         updateLoadXMLLog(log_loadList);
      }
      
      public static function disableUpdateLoadXMLLog(param1:Boolean = true) : void
      {
         useUpdateLoadXMLLog = false;
         if(updateLoadXMLLogText)
         {
            GameInstance.stage.removeEventListener(Event.ADDED,onAddedHandle2);
            if(param1)
            {
               if(updateLoadXMLLogText.parent == GameInstance.stage)
               {
                  GameInstance.stage.removeChild(updateLoadXMLLogText);
               }
            }
         }
      }
      
      public static function updateLoadXMLLog(param1:String) : void
      {
         log_loadList = param1;
         if(!useUpdateLoadXMLLog)
         {
            return;
         }
         if(!updateLoadXMLLogText)
         {
            updateLoadXMLLogText = new TextField();
            updateLoadXMLLogText.autoSize = TextFieldAutoSize.LEFT;
            updateLoadXMLLogText.multiline = true;
            updateLoadXMLLogText.wordWrap = true;
            updateLoadXMLLogText.border = true;
            updateLoadXMLLogText.width = 500;
            updateLoadXMLLogText.height = 200;
            updateLoadXMLLogText.background = true;
            updateLoadXMLLogText.backgroundColor = 16777215;
         }
         if(updateLoadXMLLogText.parent != GameInstance.stage)
         {
            GameInstance.stage.addChild(updateLoadXMLLogText);
            GameInstance.stage.addEventListener(Event.ADDED,onAddedHandle2,false,-int.MAX_VALUE);
         }
         updateLoadXMLLogText.text = log_loadList;
      }
      
      private static function onAddedHandle2(param1:Event) : void
      {
         if(updateLoadXMLLogText != null && updateLoadXMLLogText.parent == GameInstance.stage)
         {
            GameInstance.stage.setChildIndex(updateLoadXMLLogText,GameInstance.stage.numChildren - 1);
         }
      }
      
      public static function init(param1:DisplayObjectContainer, param2:Boolean = true) : void
      {
         var btn:Sprite;
         var textFiled:TextField = null;
         var mm:MovieMonitor = null;
         var sp:Sprite = null;
         var mouseDownPoint:Point = null;
         var doStartDrag:Function = null;
         var isShowLog:Boolean = false;
         var showLog:Function = null;
         var openLoadLogKey:Boolean = false;
         var openLogKey:Boolean = false;
         var onAddedHandle:Function = null;
         var container:DisplayObjectContainer = param1;
         var defaultShow:Boolean = param2;
         doStartDrag = function(param1:MouseEvent):void
         {
            mouseDownPoint.x = param1.stageX;
            mouseDownPoint.y = param1.stageY;
            var _loc2_:DragData = new DragData(sp,1,1,-1,2,new Rectangle(0,0,container.stage.stageWidth - 20,container.stage.stageHeight - 20));
            DragManager.addDrag(_loc2_);
         };
         showLog = function(param1:MouseEvent):void
         {
            if(param1.stageX != mouseDownPoint.x || param1.stageY != mouseDownPoint.y)
            {
               return;
            }
            if(isShowLog)
            {
               ZLog.enableShowInLogArea = false;
               sp.removeChild(textFiled);
               sp.removeChild(mm);
            }
            else
            {
               ZLog.enableShowInLogArea = true;
               sp.addChildAt(textFiled,0);
               sp.addChildAt(mm,0);
            }
            isShowLog = !isShowLog;
         };
         onAddedHandle = function(param1:Event = null):void
         {
            if(sp.parent == container)
            {
               container.setChildIndex(sp,container.numChildren - 1);
            }
         };
         textFiled = new TextField();
         textFiled.autoSize = TextFieldAutoSize.LEFT;
         textFiled.multiline = true;
         textFiled.wordWrap = true;
         textFiled.border = true;
         textFiled.width = 300;
         textFiled.height = 200;
         textFiled.background = true;
         textFiled.backgroundColor = 16777215;
         mm = new MovieMonitor();
         mm.x = 350;
         btn = new Sprite();
         btn.buttonMode = true;
         DrawHelper.drawRect(btn,new Point(0,0),new Point(20,20),new StyleData(1,0,1,16711680,1));
         sp = new Sprite();
         sp.addChild(textFiled);
         sp.addChild(btn);
         sp.addChild(mm);
         container.addChild(sp);
         sp.x = 5;
         sp.y = 5;
         mouseDownPoint = new Point();
         btn.addEventListener(MouseEvent.MOUSE_DOWN,doStartDrag);
         btn.addEventListener(MouseEvent.MOUSE_UP,showLog);
         isShowLog = true;
         ZLog.init(textFiled,20,true,true);
         ZLog.enableShowInLogArea = defaultShow;
         sp.visible = defaultShow;
         openLoadLogKey = false;
         openLogKey = false;
         container.stage.addEventListener(KeyboardEvent.KEY_UP,function(param1:KeyboardEvent):void
         {
            if(param1.ctrlKey && param1.shiftKey && param1.altKey)
            {
               if(param1.keyCode == Keyboard.HOME)
               {
                  UITools.init(GameInstance.uiInstance.uiContainer);
               }
            }
            if(param1.ctrlKey && param1.shiftKey)
            {
               if(param1.keyCode == QuickBtn.M)
               {
                  openLoadLogKey = true;
               }
               if(openLoadLogKey)
               {
                  if(param1.keyCode == QuickBtn.N)
                  {
                     if(useUpdateLoadXMLLog)
                     {
                        disableUpdateLoadXMLLog();
                     }
                     else
                     {
                        enableUpdateLoadXMLLog();
                     }
                  }
               }
               if(param1.keyCode == Keyboard.HOME)
               {
                  openLogKey = true;
               }
               else if(param1.keyCode == Keyboard.END)
               {
                  openLogKey = false;
               }
               if(openLogKey)
               {
                  if(param1.keyCode == Keyboard.LEFT)
                  {
                     onAddedHandle();
                     if(sp.parent != container)
                     {
                        container.addChild(sp);
                     }
                     container.addEventListener(Event.ADDED,onAddedHandle,false,-int.MAX_VALUE);
                     ZLog.enableShowInLogArea = true;
                     sp.visible = true;
                     mm.setAddEv();
                  }
                  else if(param1.keyCode == Keyboard.RIGHT)
                  {
                     container.removeEventListener(Event.ADDED,onAddedHandle);
                     ZLog.enableShowInLogArea = false;
                     sp.visible = false;
                     mm.setRemEv();
                  }
               }
            }
         });
      }
   }
}

