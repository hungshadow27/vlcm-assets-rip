package com.tgame.shell.view.components.shiJieBei
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.shiJieBei.model.info.ShiJieBeiVO;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class GuanJunJingCai extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var bg:DisplayObject;
      
      private var guanjun:FTextArea;
      
      private var wanfaBtn:SecondButton;
      
      private var xiazhuduiwuBtn:SecondButton;
      
      private var baqiangBtn:SecondButton;
      
      private var erqiangBtn:SecondButton;
      
      private var siqiangBtn:SecondButton;
      
      private var guanjunBtn:SecondButton;
      
      private var lingquBtn:NewSkinButton;
      
      private var kuang:Bitmap;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var giftList2:FList;
      
      private var guojiaId:int = 0;
      
      private var xiaohao8:int = 0;
      
      private var xiaohao4:int = 0;
      
      private var xiaohao2:int = 0;
      
      private var xiaohao1:int = 0;
      
      private var xiaZhuCanvas:FCanvas;
      
      private var shuomingFT:FTextArea;
      
      private var guoqiSpr:Sprite;
      
      private var guojia1:DisplayObject;
      
      private var guojia2:DisplayObject;
      
      private var guanjunGuoqi:DisplayObject;
      
      private var jiangLiFta:FTextArea;
      
      private var shuMingCanvs:ShiJieBeiShuoMing;
      
      public function GuanJunJingCai()
      {
         var g1:Goods;
         var item1:ItemFace;
         var g2:Goods;
         var item2:ItemFace;
         var g3:Goods;
         var item3:ItemFace;
         var g4:Goods;
         var item4:ItemFace;
         super();
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/guanjunBg.swf");
         this.bg.x = 0;
         this.bg.y = 0;
         addChild(this.bg);
         this.guoqiSpr = new Sprite();
         addChild(this.guoqiSpr);
         this.guanjun = new FTextArea();
         addChild(this.guanjun);
         this.guanjun.multiline = true;
         this.guanjun.filters = StaticValue.filter;
         this.guanjun.wordWrap = true;
         this.guanjun.width = 230 - 12;
         this.guanjun.x = 325 - 10;
         this.guanjun.y = 308;
         this.guanjun.htmlText = "<font color = \'" + StaticValue.BLUE + "\'>" + LanResManager.getLanCommonTextWords("我才冠军是巴西") + "</font>";
         this.wanfaBtn = new SecondButton();
         addChild(this.wanfaBtn);
         this.wanfaBtn.x = 536 + 37;
         this.wanfaBtn.y = 8;
         this.wanfaBtn.label = LanResManager.getLanCommonTextWords("玩法说明");
         this.wanfaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xiaZhuCanvas = new FCanvas();
         this.xiaZhuCanvas.skin = "menuBg";
         this.xiaZhuCanvas.width = 165 + 55;
         this.xiaZhuCanvas.height = 250 - 110 + 20;
         this.xiaZhuCanvas.x = 739 + 30;
         this.xiaZhuCanvas.y = 0;
         this.xiaZhuCanvas.visible = false;
         addChild(this.xiaZhuCanvas);
         this.shuomingFT = new FTextArea();
         this.xiaZhuCanvas.addChild(this.shuomingFT);
         this.shuomingFT.multiline = true;
         this.shuomingFT.autoSize = TextFieldAutoSize.LEFT;
         this.shuomingFT.wordWrap = true;
         this.shuomingFT.width = 230 - 12;
         this.shuomingFT.x = 10;
         this.shuomingFT.y = 10;
         this.xiazhuduiwuBtn = new SecondButton();
         addChild(this.xiazhuduiwuBtn);
         this.xiazhuduiwuBtn.x = 610 + 37;
         this.xiazhuduiwuBtn.y = 8;
         this.xiazhuduiwuBtn.label = LanResManager.getLanCommonTextWords("我下注的队伍");
         this.xiazhuduiwuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 20 - 3 + 15;
            y = 75;
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new ShiJieBeiList();
         this.giftList.listWidth = 130;
         this.listContainer.addChild(this.giftList);
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList2 = new FList();
         this.giftList2.skin = "list";
         this.giftList2.itemRenderer = new ShiJieBeiList();
         this.giftList2.listWidth = 130;
         this.listContainer.addChild(this.giftList2);
         this.giftList2.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.giftList2.x = 270 + 252 + 5 - 13 + 40 + 13;
         this.giftList2.y = 0;
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 220 + 20;
         this.kuang.y = 350;
         g1 = new Goods(371327);
         item1 = new ItemFace(g1);
         item1.x = 220 + 2 + 20;
         item1.y = 350 + 2;
         addChild(item1);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 305 + 20;
         this.kuang.y = 350;
         g2 = new Goods(371328);
         item2 = new ItemFace(g2);
         item2.x = 305 + 2 + 20;
         item2.y = 350 + 2;
         addChild(item2);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 385 + 20;
         this.kuang.y = 350;
         g3 = new Goods(371329);
         item3 = new ItemFace(g3);
         item3.x = 385 + 2 + 20;
         item3.y = 350 + 2;
         addChild(item3);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 460 + 20;
         this.kuang.y = 350;
         g4 = new Goods(371330);
         item4 = new ItemFace(g4);
         item4.x = 460 + 2 + 20;
         item4.y = 350 + 2;
         addChild(item4);
         this.jiangLiFta = new FTextArea();
         addChild(this.jiangLiFta);
         this.jiangLiFta.multiline = true;
         this.jiangLiFta.filters = StaticValue.filter;
         this.jiangLiFta.wordWrap = true;
         this.jiangLiFta.width = 300;
         this.jiangLiFta.x = 250;
         this.jiangLiFta.y = 395;
         this.jiangLiFta.htmlText = "<font color = \'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("下注冠军达成者另外获得三国人物永久换装一套") + "</font>";
         this.baqiangBtn = new SecondButton();
         addChild(this.baqiangBtn);
         this.baqiangBtn.x = 210 - 5 + 20;
         this.baqiangBtn.y = 420;
         this.baqiangBtn.label = LanResManager.getLanCommonTextWords("下注八强");
         this.baqiangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.siqiangBtn = new SecondButton();
         addChild(this.siqiangBtn);
         this.siqiangBtn.x = 290 - 5 + 20;
         this.siqiangBtn.y = 420;
         this.siqiangBtn.label = LanResManager.getLanCommonTextWords("下注四强");
         this.siqiangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.erqiangBtn = new SecondButton();
         addChild(this.erqiangBtn);
         this.erqiangBtn.x = 370 - 5 + 20;
         this.erqiangBtn.y = 420;
         this.erqiangBtn.label = LanResManager.getLanCommonTextWords("下注二强");
         this.erqiangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.guanjunBtn = new SecondButton();
         addChild(this.guanjunBtn);
         this.guanjunBtn.x = 450 - 5 + 20;
         this.guanjunBtn.y = 420;
         this.guanjunBtn.label = LanResManager.getLanCommonTextWords("下注冠军");
         this.guanjunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBtn = new NewSkinButton();
         this.lingquBtn.skin = "lingQueJiangLi_Button";
         addChild(this.lingquBtn);
         this.lingquBtn.x = 300;
         this.lingquBtn.y = 450;
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var str:String = null;
         var xiazhuByte:int = 0;
         var e:MouseEvent = param1;
         str = LanResManager.getLanCommonTextWords("下注将花费元宝（金票）：xxx一旦下注将无法取消");
         xiazhuByte = 0;
         switch(e.target)
         {
            case this.wanfaBtn:
               this.showShuoMing();
               break;
            case this.xiazhuduiwuBtn:
               if(this.xiaZhuCanvas.visible)
               {
                  this.xiaZhuCanvas.visible = false;
               }
               else
               {
                  this.xiaZhuCanvas.visible = true;
               }
               break;
            case this.baqiangBtn:
               str = LanResManager.getLanCommonTextWords("下注将花费金票：") + this.xiaohao8 + "<br>" + LanResManager.getLanCommonTextWords("一旦下注将无法取消！");
               xiazhuByte = 8;
               break;
            case this.siqiangBtn:
               str = LanResManager.getLanCommonTextWords("下注将花费金票：") + this.xiaohao4 + "<br>" + LanResManager.getLanCommonTextWords("一旦下注将无法取消！");
               xiazhuByte = 4;
               break;
            case this.erqiangBtn:
               str = LanResManager.getLanCommonTextWords("下注将花费金票：") + this.xiaohao2 + "<br>" + LanResManager.getLanCommonTextWords("一旦下注将无法取消！");
               xiazhuByte = 2;
               break;
            case this.guanjunBtn:
               str = LanResManager.getLanCommonTextWords("下注将花费金票：") + this.xiaohao1 + "<br>" + LanResManager.getLanCommonTextWords("一旦下注将无法取消！");
               xiazhuByte = 1;
               break;
            case this.lingquBtn:
               this.$parent.dispatchEvent(new BaseEvent(ShiJieBeiPanel.UI_SHIJIEBEI_GUANJUNJINGCAI_LINGJIANG));
         }
         if(xiazhuByte > 0)
         {
            if(this.giftList.selectItem == null && this.giftList2.selectItem == null)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请选择国家！"));
               xiazhuByte = 0;
               return;
            }
            FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
            FAlert.show(str,LanResManager.getLanCommonTextWords("下注"),2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  $parent.dispatchEvent(new BaseEvent(ShiJieBeiPanel.UI_SHIJIEBEI_GUANJUNJINGCAI_XIAZHU_XIAZHU,"",[xiazhuByte,guojiaId]));
               }
               xiazhuByte = 0;
            });
         }
      }
      
      private function showShuoMing() : void
      {
         if(!this.shuMingCanvs)
         {
            this.shuMingCanvs = new ShiJieBeiShuoMing();
         }
         this.shuMingCanvs.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.shuMingCanvs);
         this.shuMingCanvs.x = (GameConfig.sceneWidth - this.shuMingCanvs.width) / 2;
         this.shuMingCanvs.y = (GameConfig.sceneHeight - this.shuMingCanvs.height) / 2;
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.giftList:
               this.giftList2.setSelectItemByLabel("");
               this.guojiaId = this.giftList.selectItem.id;
               break;
            case this.giftList2:
               this.giftList.setSelectItemByLabel("");
               this.guojiaId = this.giftList2.selectItem.id;
         }
      }
      
      public function setList(param1:Array) : void
      {
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            if(_loc4_ < 16)
            {
               _loc2_.push(param1[_loc4_]);
            }
            else
            {
               _loc3_.push(param1[_loc4_]);
            }
            _loc4_++;
         }
         this.giftList.dataProvider = _loc2_;
         this.giftList.setSelectItemByLabel("");
         this.giftList2.dataProvider = _loc3_;
      }
      
      public function setInitialize(param1:ShiJieBeiVO) : void
      {
         var _loc3_:int = 0;
         this.guanjun.htmlText = "<font color = \'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("我竞猜的冠军：") + param1.xiaZhu1Qiang + "</font>";
         this.xiaohao8 = param1.xiaZhuXiaoHao8;
         this.xiaohao4 = param1.xiaZhuXiaoHao4;
         this.xiaohao2 = param1.xiaZhuXiaoHao2;
         this.xiaohao1 = param1.xiaZhuXiaoHao1;
         var _loc2_:String = "";
         _loc3_ = 0;
         while(_loc3_ < param1.xiaZhu2Qiang.length)
         {
            if(_loc3_ != 0)
            {
               _loc2_ += "、";
            }
            _loc2_ += param1.xiaZhu2Qiang[_loc3_];
            _loc3_++;
         }
         var _loc4_:String = "";
         _loc3_ = 0;
         while(_loc3_ < param1.xiaZhu4Qiang.length)
         {
            if(_loc3_ != 0)
            {
               _loc4_ += "、";
            }
            _loc4_ += param1.xiaZhu4Qiang[_loc3_];
            _loc3_++;
         }
         var _loc5_:String = "";
         _loc3_ = 0;
         while(_loc3_ < param1.xiaZhu8Qiang.length)
         {
            if(_loc3_ != 0)
            {
               _loc5_ += "、";
            }
            _loc5_ += param1.xiaZhu8Qiang[_loc3_];
            _loc3_++;
         }
         this.shuomingFT.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("我下注的队伍") + "<br><br><br>" + LanResManager.getLanCommonTextWords("冠军：") + param1.xiaZhu1Qiang + "<br>" + LanResManager.getLanCommonTextWords("二强：") + _loc2_ + "<br>" + LanResManager.getLanCommonTextWords("四强：") + _loc4_ + "<br>" + LanResManager.getLanCommonTextWords("八强：") + _loc5_ + "<br></font>";
         this.baqiangBtn.enabled = param1.canXiaZhu8Qiang;
         this.siqiangBtn.enabled = param1.canXiaZhu4Qiang;
         this.erqiangBtn.enabled = param1.canXiaZhu2Qiang;
         this.guanjunBtn.enabled = param1.canXiaZhu1Qiang;
         while(this.guoqiSpr.numChildren > 0)
         {
            this.guoqiSpr.removeChildAt(0);
         }
         if(param1.qianLiangMing1 > 0)
         {
            this.guojia1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/" + param1.qianLiangMing1 + ".swf");
            this.guojia1.x = 229;
            this.guojia1.y = 45;
            this.guoqiSpr.addChild(this.guojia1);
         }
         if(param1.qianLiangMing2 > 0)
         {
            this.guojia2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/" + param1.qianLiangMing2 + ".swf");
            this.guojia2.x = 428;
            this.guojia2.y = 45;
            this.guoqiSpr.addChild(this.guojia2);
         }
         if(param1.guanJunId > 0)
         {
            this.guanjunGuoqi = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/" + param1.guanJunId + ".swf");
            this.guanjunGuoqi.x = 329;
            this.guanjunGuoqi.y = 224;
            this.guoqiSpr.addChild(this.guanjunGuoqi);
         }
         this.setList(param1.guoJiaArr);
      }
      
      public function showXiaZhuCanvas(param1:Boolean) : void
      {
         this.xiaZhuCanvas.visible = param1;
      }
   }
}

