package com.tgame.shell.view.components.wangzhezhibang
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.WangzhezhibangPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class WangzhezhibangZhuweiPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var titleFta:FTextArea;
      
      private var ft:FTextArea;
      
      private var ftPage:FTextArea;
      
      private var ftCishu:FTextArea;
      
      private var ftPaiming:FTextArea;
      
      private var ftQuery:FTextInput;
      
      private var btnPre:SecondButton;
      
      private var btnNext:SecondButton;
      
      private var btnSelect:SecondButton;
      
      private var btnMy:SecondButton;
      
      private var sortBtn:FSimpleButton;
      
      private var btnQuery:SecondButton;
      
      private var giftList:FList;
      
      private var listContainer:Sprite;
      
      private var selectID:int = -1;
      
      private var serverID:int = -1;
      
      private var pingtaiID:int = -1;
      
      private var page:int = 0;
      
      private var sortText:String = "";
      
      private var arrValue:Array = [];
      
      private var sortType:Boolean = true;
      
      public function WangzhezhibangZhuweiPanel()
      {
         super();
         skin = "panel_btn";
         width = 575;
         height = 515;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("王者之帮助威榜");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var bg:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zhuwei_bg.png",556,463);
         bg.x = 8;
         bg.y = 0;
         addChild(bg);
         this.titleFta = new FTextArea();
         this.titleFta.filters = StaticValue.filter;
         this.titleFta.width = 550;
         this.titleFta.height = 110;
         this.titleFta.x = 15;
         this.titleFta.y = 10;
         this.titleFta.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + " " + LanResManager.getLanCommonTextWords("排名") + "                   " + LanResManager.getLanCommonTextWords("帮派名称") + "                            " + LanResManager.getLanCommonTextWords("帮主") + "              " + LanResManager.getLanCommonTextWords("总助威数") + "       " + LanResManager.getLanCommonTextWords("本人助威数") + "           " + LanResManager.getLanCommonTextWords("本轮争霸战绩") + "</font>";
         addChild(this.titleFta);
         this.sortBtn = new FSimpleButton();
         this.sortBtn.skin = "changeButton";
         this.sortBtn.name = "no";
         this.sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         this.sortBtn.rotation = 180;
         addChild(this.sortBtn);
         this.sortBtn.x = 60 + 2;
         this.sortBtn.y = 20;
         this.sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         this.sortBtn = new FSimpleButton();
         this.sortBtn.skin = "changeButton";
         this.sortBtn.name = "count";
         this.sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         this.sortBtn.rotation = 180;
         addChild(this.sortBtn);
         this.sortBtn.x = 460 + 2;
         this.sortBtn.y = 20;
         this.sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         this.sortBtn = new FSimpleButton();
         this.sortBtn.skin = "changeButton";
         this.sortBtn.name = "value";
         this.sortBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击可排序") + "</font>";
         this.sortBtn.rotation = 180;
         addChild(this.sortBtn);
         this.sortBtn.x = 550 + 3;
         this.sortBtn.y = 20;
         this.sortBtn.addEventListener(MouseEvent.CLICK,this.onSort);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 10;
            y = 30;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,550,275);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new WangzhezhibangZhuweiRanader();
         this.giftList.listWidth = 550;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 298;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("帮会搜索") + "</font>";
         this.ft.width = 50;
         addChild(this.ft);
         this.ftQuery = new FTextInput();
         this.ftQuery.textColor = 16777215;
         this.ftQuery.border = true;
         addChild(this.ftQuery);
         this.ftQuery.x = 80;
         this.ftQuery.y = 298;
         this.ftQuery.width = 100;
         this.ftQuery.height = 20;
         this.btnQuery = new SecondButton();
         this.btnQuery.x = 190;
         this.btnQuery.y = 298;
         this.btnQuery.label = LanResManager.getLanCommonTextWords("搜索");
         this.btnQuery.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnQuery);
         this.btnPre = new SecondButton();
         this.btnPre.x = 210 + 140;
         this.btnPre.y = 298;
         this.btnPre.label = LanResManager.getLanCommonTextWords("上一页");
         this.btnPre.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnPre);
         this.ftPage = new FTextArea();
         this.ftPage.x = this.btnPre.x + this.btnPre.width + 5;
         this.ftPage.y = 298;
         this.ftPage.textColor = StaticValue.WHITE;
         this.ftPage.width = 40;
         this.ftPage.htmlText = "1/1";
         addChild(this.ftPage);
         this.btnNext = new SecondButton();
         this.btnNext.x = this.ftPage.x + this.ftPage.width + 10;
         this.btnNext.y = 298;
         this.btnNext.label = LanResManager.getLanCommonTextWords("下一页");
         this.btnNext.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnNext);
         this.ft = new FTextArea();
         this.ft.x = 16;
         this.ft.y = 330;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.width = 555;
         this.ft.htmlText = "<textformat leading = \'1\'>" + LanResManager.getLanCommonTextWords("1.助威榜前256名帮会可参加比赛，助威时间活动报名当天0点至24点，") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("榜单每半小时刷新一次。") + "</font><br>" + LanResManager.getLanCommonTextWords("2.玩家每次点击助威将扣除10点元宝并且反给玩家10金票，每个玩家最多可助威10次。") + "<br>" + LanResManager.getLanCommonTextWords("3.助威成功的玩家。在比赛结束后，可根据助威帮会取得的名次，获得金票返利，（16强，4强，冠军）分别对应返还助威金额（同等金票，双倍金票，三倍金票），返利的金票在比赛结束后帮战奖励按钮处领取。并且如果帮派被助威数达到（500，1000,1500以上）,那么进入比赛后根据帮会助威数，相应帮会全体人员将获得全属性增加（5%，10%，15%）的战场状态。每次活动报名开启时清空上次榜单记录。") + "<br>" + "</textformat>";
         this.ft.wordWrap = true;
         this.ft.height = 110;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 448;
         this.ft.textColor = StaticValue.BLUE;
         this.ft.width = 120;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("我的帮会总助威次数：");
         addChild(this.ft);
         this.ftCishu = new FTextArea();
         this.ftCishu.x = 145;
         this.ftCishu.y = 448;
         this.ftCishu.textColor = StaticValue.BLUE;
         this.ftCishu.width = 100;
         addChild(this.ftCishu);
         this.ft = new FTextArea();
         this.ft.x = 220;
         this.ft.y = 448;
         this.ft.textColor = StaticValue.BLUE;
         this.ft.width = 120;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("我的帮派排名：");
         addChild(this.ft);
         this.ftPaiming = new FTextArea();
         this.ftPaiming.x = 310;
         this.ftPaiming.y = 448;
         this.ftPaiming.textColor = StaticValue.BLUE;
         this.ftPaiming.width = 100;
         addChild(this.ftPaiming);
         this.btnSelect = new SecondButton();
         this.btnSelect.x = 365 - 30;
         this.btnSelect.y = 448;
         this.btnSelect.label = LanResManager.getLanCommonTextWords("助威选中帮派");
         this.btnSelect.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnSelect);
         this.btnMy = new SecondButton();
         this.btnMy.x = 470;
         this.btnMy.y = 448;
         this.btnMy.label = LanResManager.getLanCommonTextWords("助威我的帮派");
         this.btnMy.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnMy);
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         this.selectID = int(this.giftList.selectItem.id);
         this.serverID = int(this.giftList.selectItem.serverID);
         this.pingtaiID = int(this.giftList.selectItem.pingtaiID);
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         switch(param1.target)
         {
            case this.btnMy:
               this.$parent.dispatchEvent(new BaseEvent(WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIWODEBANGPAI,"",this.pingtaiID));
               break;
            case this.btnNext:
               this.$parent.dispatchEvent(new BaseEvent(WangzhezhibangPanel.UI_WANGZHEZHIBANG_BANGHUIZHUWEI_FANYE,"",this.page + 1));
               break;
            case this.btnPre:
               this.$parent.dispatchEvent(new BaseEvent(WangzhezhibangPanel.UI_WANGZHEZHIBANG_BANGHUIZHUWEI_FANYE,"",this.page - 1));
               break;
            case this.btnSelect:
               if(this.selectID == -1)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("请选择帮派！"),LanResManager.getLanCommonTextWords("提示"));
                  return;
               }
               this.$parent.dispatchEvent(new BaseEvent(WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIBANGPAI,"",[this.selectID,this.serverID,this.pingtaiID]));
               break;
            case this.btnQuery:
               this.$parent.dispatchEvent(new BaseEvent(WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIQUERY,"",[this.page,this.ftQuery.text]));
         }
      }
      
      private function onSort(param1:MouseEvent = null) : void
      {
         if(param1)
         {
            this.sortText = param1.target.name;
         }
         var _loc2_:Array = this.giftList.getDataProvider();
         if(this.sortType)
         {
            _loc2_.sort(this.sortFun1,Array.DESCENDING);
         }
         else if(!this.sortType)
         {
            _loc2_.sort(this.sortFun2,Array.DESCENDING);
         }
         this.giftList.dataProvider = _loc2_;
         if(_loc2_.length > 0)
         {
            this.giftList.setSelectItemByIndex(0);
         }
      }
      
      private function sortFun1(param1:Object, param2:Object) : Number
      {
         if(this.sortText == "")
         {
            return 0;
         }
         this.sortType = false;
         var _loc3_:Number = Number(param1[this.sortText]);
         var _loc4_:Number = Number(param2[this.sortText]);
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      private function sortFun2(param1:Object, param2:Object) : Number
      {
         if(this.sortText == "")
         {
            return 0;
         }
         this.sortType = true;
         var _loc3_:Number = Number(param1[this.sortText]);
         var _loc4_:Number = Number(param2[this.sortText]);
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc3_ < _loc4_)
         {
            return 1;
         }
         return 0;
      }
      
      public function setData(param1:Array, param2:int, param3:int, param4:int, param5:int) : void
      {
         if(param2 == 0)
         {
            param2 = 1;
         }
         this.page = param2;
         this.selectID = -1;
         this.serverID = -1;
         this.pingtaiID = -1;
         this.giftList.dataProvider = param1;
         this.arrValue = param1;
         if(this.page <= 1)
         {
            this.btnPre.enabled = false;
         }
         else
         {
            this.btnPre.enabled = true;
         }
         if(this.page >= param3)
         {
            this.btnNext.enabled = false;
            this.page = param2 = param3;
         }
         else
         {
            this.btnNext.enabled = true;
         }
         this.ftPage.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "/" + param3 + "</font>";
         this.ftCishu.htmlText = String(param4);
         this.ftPaiming.htmlText = String(param5);
      }
   }
}

