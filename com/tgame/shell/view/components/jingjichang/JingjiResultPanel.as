package com.tgame.shell.view.components.jingjichang
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.greensock.TweenLite;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.easing.Circ;
   
   public class JingjiResultPanel extends FPanel
   {
      
      public static const UI_3V3_TUICHU:String = "UI_3V3_TUICHU";
      
      private var userList:FList;
      
      private var yellowBit:Sprite;
      
      private var blueBit:Sprite;
      
      private var jingjiResult:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var yellewTeam:FLabel;
      
      private var blueTeam:FLabel;
      
      private var selfListTitle:FLabel;
      
      public function JingjiResultPanel()
      {
         super();
         dragAble = true;
         this.skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 492;
         height = 289;
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
         }
         this.tipCanvas.addChild(this.tip);
         this.initPanel();
      }
      
      private function initPanel() : void
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var listTitle:FLabel;
         var closeBtn:SecondButton;
         titleText = LanResManager.getLanCommonTextWords("竞技结果");
         bg = new Bitmap();
         bg.name = "ui.jingjichang.jieguo.ui";
         addChild(bg);
         bg.x = 7.5;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         this.showCloseButton = false;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         listTitle = new FLabel();
         with(listTitle)
         {
            x = 16;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("排名");
         }
         addChild(listTitle);
         listTitle = new FLabel();
         with(listTitle)
         {
            x = 72;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("角色名");
         }
         addChild(listTitle);
         listTitle = new FLabel();
         with(listTitle)
         {
            x = 139;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("所属队伍");
         }
         addChild(listTitle);
         this.selfListTitle = new FLabel();
         with(this.selfListTitle)
         {
            x = 204;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.selfListTitle.text = LanResManager.getLanCommonTextWords("曾占领旗帜数");
         addChild(this.selfListTitle);
         listTitle = new FLabel();
         with(listTitle)
         {
            x = 292;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("胜率");
         }
         addChild(listTitle);
         listTitle = new FLabel();
         with(listTitle)
         {
            x = 340;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("击败玩家数");
         }
         addChild(listTitle);
         listTitle = new FLabel();
         with(listTitle)
         {
            x = 418;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("被击败次数");
         }
         addChild(listTitle);
         this.userList = new FList();
         this.userList.skin = "list";
         this.userList.listWidth = 478;
         this.userList.listHeight = 96;
         this.userList.itemRenderer = new JingjiResultRander();
         addChild(this.userList);
         this.userList.x = 10;
         this.userList.y = 22;
         this.userList.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
         this.userList.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
         this.yellewTeam = new FLabel();
         with(this.yellewTeam)
         {
            x = 17;
            y = 129;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         this.yellewTeam.text = LanResManager.getLanCommonTextWords("黄队最终占旗数");
         addChild(this.yellewTeam);
         this.blueTeam = new FLabel();
         with(this.blueTeam)
         {
            x = 17;
            y = 172;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         this.blueTeam.text = LanResManager.getLanCommonTextWords("蓝队最终占旗数");
         addChild(this.blueTeam);
         closeBtn = new SecondButton();
         closeBtn.label = LanResManager.getLanCommonTextWords("退出竞技");
         closeBtn.x = this.width * 0.5 - closeBtn.width * 0.5;
         closeBtn.y = 232;
         closeBtn.addEventListener(MouseEvent.CLICK,this.closeHandler);
         addChild(closeBtn);
         this.jingjiResult = new FTextArea();
         with(this.jingjiResult)
         {
            x = 122;
            y = 130 - 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         addChild(this.jingjiResult);
      }
      
      private function onListMouse(param1:MouseEvent) : void
      {
         var _loc2_:FListCellRenderer = null;
         var _loc3_:Object = null;
         var _loc4_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               this.userList.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target as TextField)
               {
                  _loc2_ = (param1.target as TextField).parent as FListCellRenderer;
                  _loc3_ = _loc2_.data;
                  this.tip.text = _loc3_.userName;
                  this.tipCanvas.width = this.tip.width + 4;
                  this.tipCanvas.height = this.tip.height + 4;
                  this.tipCanvas.visible = true;
                  _loc4_ = _loc2_.parent.localToGlobal(new Point(_loc2_.x,_loc2_.y));
                  this.tipCanvas.x = _loc4_.x - this.tipCanvas.width;
                  this.tipCanvas.y = _loc4_.y;
               }
               else
               {
                  this.tipCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OUT:
               this.userList.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               Tools.currentStage.removeChild(this.tipCanvas);
         }
      }
      
      public function setJingjiResult(param1:XML, param2:int, param3:int, param4:Array) : void
      {
         this.selfListTitle.text = LanResManager.getLanCommonTextWords("曾占领旗帜数");
         this.yellewTeam.text = LanResManager.getLanCommonTextWords("黄队最终占旗数");
         this.blueTeam.text = LanResManager.getLanCommonTextWords("蓝队最终占旗数");
         this.userList.itemRenderer = new JingjiResultRander();
         this.userList.dataProvider = param1;
         this.setZhanqi(param2,param3);
         this.jingjiResult.htmlText = this.getResult(param4);
      }
      
      public function setJingjiResult_PK(param1:XML, param2:int, param3:int, param4:Array) : void
      {
         this.selfListTitle.text = LanResManager.getLanCommonTextWords("胜负状态");
         this.yellewTeam.text = LanResManager.getLanCommonTextWords("黄队击败对手数");
         this.blueTeam.text = LanResManager.getLanCommonTextWords("蓝队击败对手数");
         this.userList.itemRenderer = new JingjiResultRander_PK();
         this.userList.dataProvider = param1;
         this.setZhanqi(param2,param3);
         this.jingjiResult.htmlText = this.getResult(param4);
      }
      
      private function setZhanqi(param1:int, param2:int) : void
      {
         this.tweenCount("huang",param1);
         this.tweenCount("lan",param2);
      }
      
      private function tweenCount(param1:String, param2:int) : void
      {
         var speed:Number;
         var obj:Object = null;
         var oldNum:int = 0;
         var onUpdate:Function = null;
         var onComplete:Function = null;
         var type:String = param1;
         var num:int = param2;
         onUpdate = function():void
         {
            var _loc1_:int = int(obj.num);
            if(_loc1_ != oldNum)
            {
               oldNum = _loc1_;
               showCount(type,_loc1_);
            }
         };
         onComplete = function():void
         {
            if(oldNum != num)
            {
               showCount(type,num);
            }
         };
         if(num <= 0)
         {
            this.showCount(type,0);
            return;
         }
         speed = 4;
         obj = {"num":0};
         TweenLite.to(obj,num / speed,{
            "num":num,
            "onUpdate":onUpdate,
            "onComplete":onComplete,
            "ease":Circ.easeOut
         });
         oldNum = -1;
      }
      
      private function showCount(param1:String, param2:int) : void
      {
         if(param1 == "huang")
         {
            if(this.yellowBit != null)
            {
               this.yellowBit.parent.removeChild(this.yellowBit);
            }
            this.yellowBit = this.getNumsprite(param2,param1);
            this.yellowBit.x = 44;
            this.yellowBit.y = 150;
            this.addChild(this.yellowBit);
         }
         else if(param1 == "lan")
         {
            if(this.blueBit != null)
            {
               this.blueBit.parent.removeChild(this.blueBit);
            }
            this.blueBit = this.getNumsprite(param2,param1);
            this.blueBit.x = 44;
            this.blueBit.y = 194;
            this.addChild(this.blueBit);
         }
      }
      
      private function getResult(param1:Array) : String
      {
         var _loc2_:String = String(param1[0]);
         var _loc3_:String = String(param1[1]);
         var _loc4_:String = String(param1[2]);
         var _loc5_:String = String(param1[3]);
         var _loc6_:String = String(param1[4]);
         var _loc7_:String = String(param1[5]);
         var _loc8_:String = String(param1[6]);
         var _loc9_:String = String(param1[7]);
         var _loc10_:String = String(param1[8]);
         var _loc11_:int = int(param1[9]);
         var _loc12_:String = "<textformat leading=\'1\'>";
         var _loc13_:String = LanResManager.getLanCommonTextWords("经验：") + _loc2_ + "(" + LanResManager.getLanCommonTextWords("本场") + ")/" + _loc3_ + "(" + LanResManager.getLanCommonTextWords("今日") + ")/" + _loc4_ + "(" + LanResManager.getLanCommonTextWords("今日上限") + ")<br>" + LanResManager.getLanCommonTextWords("真气：") + _loc5_ + "(" + LanResManager.getLanCommonTextWords("本场") + ")/" + _loc6_ + "(" + LanResManager.getLanCommonTextWords("今日") + ")/" + _loc7_ + "(" + LanResManager.getLanCommonTextWords("今日上限") + ")<br>" + LanResManager.getLanCommonTextWords("论剑声望：") + _loc8_ + "(" + LanResManager.getLanCommonTextWords("本场") + ")/" + _loc9_ + "(" + LanResManager.getLanCommonTextWords("今日") + ")/" + _loc10_ + "(" + LanResManager.getLanCommonTextWords("今日上限") + ")<br>";
         switch(_loc11_)
         {
            case 0:
               _loc12_ = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"很遗憾，您所在队伍本次竞技失败") + LanResManager.getLanCommonTextWords("您额外获得安慰奖：") + "<br>" + _loc13_ + LanResManager.getLanCommonTextWords("竞技收益已全部进入跨服包裹，返回原服后可领") + "</font>";
               break;
            case 1:
               _loc12_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"恭喜，您所在队伍本次竞技胜利") + "<br>" + _loc13_ + "</font>";
               break;
            case 2:
               _loc12_ = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"您所在队伍本次竞技战平") + "<br>" + _loc13_ + "</font>";
         }
         return _loc12_ + "</textformat>";
      }
      
      private function getNumsprite(param1:int, param2:String) : Sprite
      {
         var _loc6_:Bitmap = null;
         var _loc3_:Sprite = new Sprite();
         var _loc4_:String = param1.toString();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = StaticValue.getBitmapByClassName("ui.jingjichang." + param2 + "." + _loc4_.charAt(_loc5_));
            _loc3_.addChild(_loc6_);
            _loc6_.x = _loc5_ * _loc6_.width;
            _loc5_++;
         }
         _loc3_.mouseChildren = false;
         _loc3_.mouseEnabled = false;
         return _loc3_;
      }
      
      private function closeHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(JingjiResultPanel.UI_3V3_TUICHU));
         this.onClose(null);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

