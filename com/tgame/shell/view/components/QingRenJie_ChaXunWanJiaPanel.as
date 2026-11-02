package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.friend.*;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class QingRenJie_ChaXunWanJiaPanel extends FPanel
   {
      
      public static const UI_QINGRENJIE_CHAXUNWANJIA_CHAXUNBTN_CLICK:String = "UI_QINGRENJIE_CHAXUNWANJIA_CHAXUNBTN_CLICK";
      
      public static const UI_QINGRENJIE_CHAXUNWANJIA_SHANGYIYEBTN_CLICK:String = "UI_QINGRENJIE_CHAXUNWANJIA_SHANGYIYEBTN_CLICK";
      
      public static const UI_QINGRENJIE_CHAXUNWANJIA_XIAYIYEBTN_CLICK:String = "UI_QINGRENJIE_CHAXUNWANJIA_XIAYIYEBTN_CLICK";
      
      public static const UI_QINGRENJIE_CHAXUNWANJIA_WOYAOSONGHUABTN_CLICK:String = "UI_QINGRENJIE_CHAXUNWANJIA_WOYAOSONGHUABTN_CLICK";
      
      public static const UI_QINGRENJIE_CHAXUNWANJIA_FANGRUBTN_CLICK:String = "UI_QINGRENJIE_CHAXUNWANJIA_FANGRUBTN_CLICK";
      
      public static const UI_QINGRENJIE_CHAXUNWANJIA_SONGHUABTN_CLICK:String = "UI_QINGRENJIE_CHAXUNWANJIA_SONGHUABTN_CLICK";
      
      public static const UI_38HUODONG_CHAXUNWANJIA_SNOGHUA_CLICK:String = "UI_38HUODONG_CHAXUNWANJIA_SNOGHUA_CLICK";
      
      private var input:FTextInput;
      
      private var searchBtn:FSimpleButton;
      
      private var playerList:FList;
      
      private var playerListSpr:Sprite;
      
      private var preBtn:FSimpleButton;
      
      private var count:FTextArea;
      
      private var nextBtn:FSimpleButton;
      
      private var lookBtn:SecondButton;
      
      private var addBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var songhuamianban:QingRenJie_SongHuaPanel;
      
      private var dangqianye:int = 0;
      
      private var shangfan:int = 0;
      
      private var xiafan:int = 0;
      
      private var typ:int = -1;
      
      public function QingRenJie_ChaXunWanJiaPanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         super();
         skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 284;
         height = 267;
         titleText = LanResManager.getLanCommonTextWords("查询玩家");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.friend.player.search.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SearchPlayerPanel,"玩家名");
         }
         addChild(lb);
         this.input = new FTextInput();
         with(this.input)
         {
            x = 90;
            y = 6;
            textColor = StaticValue.WHITE;
         }
         this.input.setMaxChars(12);
         addChild(this.input);
         this.searchBtn = new FSimpleButton();
         this.searchBtn.skin = "searchButton";
         addChild(this.searchBtn);
         this.searchBtn.x = 216;
         this.searchBtn.y = 8;
         this.searchBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            y = 30;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SearchPlayerPanel,"查找结果");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 57;
            y = 54;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("名字");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 158;
            y = 54;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 220;
            y = 54;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("门派");
         }
         addChild(lb);
         this.playerListSpr = new Sprite();
         addChild(this.playerListSpr);
         this.playerList = new FList();
         this.playerList.skin = "list";
         this.playerList.itemRenderer = new SearchPlayerListRender();
         this.playerList.listWidth = 266;
         this.playerList.listHeight = 100;
         this.playerListSpr.addChild(this.playerList);
         this.playerList.x = 9;
         this.playerList.y = 74;
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            y = 180;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(SearchPlayerPanel,"本处支持模糊玩家名搜索");
         }
         addChild(lb);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = 186;
         this.preBtn.y = 180;
         this.preBtn.enabled = false;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.count = new FTextArea();
         addChild(this.count);
         this.count.multiline = true;
         this.count.wordWrap = true;
         this.count.width = 230 - 50;
         this.count.x = 206;
         this.count.y = 180;
         this.count.htmlText = "<font  size = \'14\' color=\'" + StaticValue.BlUE20_HTML + "\'>1</font>";
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = 234;
         this.nextBtn.y = 180;
         this.nextBtn.enabled = false;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanTextWords(AddFriendPanel,"查看资料");
         addChild(this.lookBtn);
         this.lookBtn.enabled = false;
         this.lookBtn.x = 15;
         this.lookBtn.y = 212;
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addBtn = new SecondButton();
         this.addBtn.label = LanResManager.getLanCommonTextWords("送花");
         addChild(this.addBtn);
         this.addBtn.enabled = false;
         this.addBtn.x = 98;
         this.addBtn.y = 212;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - this.cancelBtn.width - 15 - 100;
         this.cancelBtn.y = 212;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.searchBtn:
               if(this.input.text == "")
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("请输入收花人的名字"));
               }
               else
               {
                  this.dispatchEvent(new BaseEvent(UI_QINGRENJIE_CHAXUNWANJIA_CHAXUNBTN_CLICK,"",[1,this.input.text]));
               }
               break;
            case this.preBtn:
               this.dispatchEvent(new BaseEvent(UI_QINGRENJIE_CHAXUNWANJIA_SHANGYIYEBTN_CLICK,"",[this.dangqianye - 1,this.input.text]));
               break;
            case this.nextBtn:
               this.dispatchEvent(new BaseEvent(UI_QINGRENJIE_CHAXUNWANJIA_XIAYIYEBTN_CLICK,"",[this.dangqianye + 1,this.input.text]));
               break;
            case this.lookBtn:
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_LOOK_INFOBTN_CLICK,"",int(this.playerList.selectItem.id)));
               break;
            case this.addBtn:
               dispatchEvent(new BaseEvent(UI_38HUODONG_CHAXUNWANJIA_SNOGHUA_CLICK,"",[int(this.playerList.selectItem.id),this.typ]));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.reset();
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function reset() : void
      {
         this.playerListSpr.visible = false;
         this.lookBtn.enabled = this.addBtn.enabled = false;
         this.input.text = "";
      }
      
      public function setList(param1:Array, param2:int) : void
      {
         this.playerListSpr.visible = true;
         this.playerList.dataProvider = param1;
         if(param1.length == 0)
         {
            this.lookBtn.enabled = this.addBtn.enabled = false;
         }
         else
         {
            this.lookBtn.enabled = this.addBtn.enabled = true;
            this.playerList.setSelectItemByIndex(0);
         }
         this.count.htmlText = "<font  size = \'14\' color=\'" + StaticValue.BlUE20_HTML + "\'>" + param2 + "</font>";
         this.dangqianye = param2;
         this.shangfan = this.dangqianye - 1;
         if(this.dangqianye <= 0)
         {
            this.dangqianye = 0;
         }
         --this.xiafan;
         if(this.xiafan <= 0)
         {
            this.xiafan = 1;
         }
         if(param2 <= 1)
         {
            this.preBtn.enabled = false;
         }
         else
         {
            this.preBtn.enabled = true;
         }
         if(param1.length <= 5)
         {
            this.nextBtn.enabled = false;
         }
         else
         {
            this.nextBtn.enabled = true;
         }
      }
      
      public function setSonghuamianban(param1:String, param2:String, param3:String, param4:String) : void
      {
         if(!this.songhuamianban)
         {
            this.songhuamianban = new QingRenJie_SongHuaPanel();
            this.songhuamianban.$parent = this;
         }
         this.songhuamianban.x = (GameConfig.sceneWidth - this.songhuamianban.width) / 2;
         this.songhuamianban.y = (GameConfig.sceneHeight - this.songhuamianban.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.songhuamianban);
         this.songhuamianban.setType(this.typ);
         this.songhuamianban.setTouxiang(param1,param2,param3,param4,int(this.playerList.selectItem.id));
      }
      
      public function setXianhua(param1:Goods) : void
      {
         this.songhuamianban.setItem(param1);
      }
      
      public function setType(param1:int) : void
      {
         this.typ = param1;
         if(param1 == 1 || param1 == 3 || param1 == 5 || param1 == 6)
         {
            this.addBtn.label = LanResManager.getLanCommonTextWords("送花");
         }
         else if(param1 == 2)
         {
            this.addBtn.label = LanResManager.getLanCommonTextWords("送祝福");
         }
         else if(param1 == 4)
         {
            this.addBtn.label = LanResManager.getLanCommonTextWords("违规举报");
         }
         else if(param1 == 7)
         {
            this.addBtn.label = LanResManager.getLanCommonTextWords("送贺卡");
         }
         else if(param1 == 8)
         {
            this.addBtn.label = LanResManager.getLanCommonTextWords("送女人");
         }
         else if(param1 == 9)
         {
            this.addBtn.label = LanResManager.getLanCommonTextWords("投票");
         }
         else if(param1 == 10)
         {
            this.addBtn.label = "Tặng Quà";
         }
      }
   }
}

