package com.tgame.shell.view.components.ride
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.NoticeManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class XueShouTuiBianPanel extends FPanel
   {
      
      public static const UI_RIDE_XUESHOUTUIBIAN_CLICK:String = "UI_RIDE_XUESHOUTUIBIAN_CLICK";
      
      public static const UI_RIDE_MOUNT_SETLECT:String = "UI_RIDE_MOUNT_SETLECT";
      
      public var $parent:DisplayObject;
      
      public var rideList:FList;
      
      private var scroll:FVScorllBar;
      
      private var xueshouId:int;
      
      private var tuibianBtn:SecondButton;
      
      private var partyNameInput:FTextInput;
      
      private var miaoshu:FTextArea;
      
      private var title:FLabel;
      
      private var bg1:DisplayObject;
      
      private var mingzi:FTextArea;
      
      private var tf:TextFormat;
      
      public function XueShouTuiBianPanel()
      {
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 362;
         height = 424;
         this.titleText = LanResManager.getLanCommonTextWords("坐骑蜕变");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woDeMenPai/tuibian.swf");
         this.bg1.x = 8;
         this.bg1.y = 0;
         addChild(this.bg1);
         this.rideList = new FList();
         this.rideList.skin = "list";
         this.rideList.itemRenderer = new XueShouTuiBianList();
         this.rideList.listWidth = 72;
         addChild(this.rideList);
         this.rideList.x = 10;
         this.rideList.y = 28;
         this.rideList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scroll = new FVScorllBar(this.rideList,230);
         addChild(this.scroll);
         this.scroll.x = 61 + 10;
         this.scroll.y = 28;
         this.title = new FLabel();
         this.title.textColor = 16777215;
         this.title.selectable = false;
         addChild(this.title);
         this.title.x = 12;
         this.title.y = 6;
         this.title.text = LanResManager.getLanCommonTextWords("拥有坐骑：");
         this.mingzi = new FTextArea();
         addChild(this.mingzi);
         this.mingzi.width = 200;
         this.mingzi.x = 210;
         this.mingzi.y = 15;
         this.partyNameInput = new FTextInput();
         with(this.partyNameInput)
         {
            x = 200;
            y = 227;
            width = 240;
            height = 20;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("请输入弟子的名称");
         }
         this.partyNameInput.setMaxChars(12);
         addChild(this.partyNameInput);
         this.partyNameInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         this.partyNameInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.width = 340;
         this.miaoshu.x = 12;
         this.miaoshu.y = 275;
         this.miaoshu.htmlText = "<font size = \'12\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("说明：") + "<br>" + LanResManager.getLanCommonTextWords("1.建立门派的玩家可以选择【蜕变】，进化时须将装备脱掉;") + "<br>" + LanResManager.getLanCommonTextWords("2.坐骑品质达到血兽以上，坐骑等级达到200级以上，可以蜕变;") + "<br>" + LanResManager.getLanCommonTextWords("3.进化后的坐骑将消失，变为你的弟子，可以在[门派]中查看;") + "</font>";
         this.tuibianBtn = new SecondButton();
         addChild(this.tuibianBtn);
         this.tuibianBtn.x = 140;
         this.tuibianBtn.y = 360;
         this.tuibianBtn.label = LanResManager.getLanCommonTextWords("开始蜕变");
         this.tuibianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onFocus(param1:FocusEvent) : void
      {
         if(param1.type == FocusEvent.FOCUS_IN)
         {
            switch(param1.target)
            {
               case this.partyNameInput:
                  this.partyNameInput.text = "";
            }
         }
         else if(param1.type == FocusEvent.FOCUS_OUT)
         {
            switch(param1.target)
            {
               case this.partyNameInput:
                  if(this.partyNameInput.text == "")
                  {
                     this.partyNameInput.text = LanResManager.getLanCommonTextWords("请输入弟子的名称");
                  }
            }
         }
      }
      
      public function ridelist(param1:int, param2:Array) : void
      {
         this.mingzi.htmlText = "";
         this.rideList.dataProvider = param2;
         this.scroll.update();
         this.rideCount(param1);
      }
      
      public function rideCount(param1:int) : void
      {
         this.title.text = LanResManager.getLanCommonTextWords("拥有坐骑：") + param1;
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         this.xueshouId = int(this.rideList.selectItem.id);
         this.mingzi.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("名称：") + this.rideList.selectItem.name + "<br>" + LanResManager.getLanCommonTextWords("等级：") + this.rideList.selectItem.mountAttributeInfo.lv + "<br>" + LanResManager.getLanCommonTextWords("身价：") + this.rideList.selectItem.mountAttributeInfo.identity + "</font>";
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var str:String;
         var e:MouseEvent = param1;
         if(this.rideList.selectItem == null)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请选择坐骑！"));
            return;
         }
         if(this.partyNameInput.text == "" || this.partyNameInput.text == LanResManager.getLanCommonTextWords("请输入弟子的名称"))
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请输入弟子的名称"));
            return;
         }
         str = "";
         str = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + "       " + LanResManager.getLanCommonTextWords("确定要将此坐骑进行蜕变？") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("（蜕变后坐骑的属性、技能都将遗忘，变为全新的载体）") + "<br></font></textformat>";
         FAlert.okLabel = LanResManager.getLanCommonTextWords("确认蜕变");
         FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消蜕变");
         FAlert.show(str,"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               dispatchEvent(new BaseEvent(UI_RIDE_XUESHOUTUIBIAN_CLICK,"",[xueshouId,partyNameInput.text]));
            }
         });
      }
   }
}

