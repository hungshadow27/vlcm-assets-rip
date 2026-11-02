package com.tgame.shell.view.components.fabao
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.FabaoPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class FabaoTupoPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ftValueDesc:FTextArea;
      
      private var ftNowValue:FTextArea;
      
      private var ftNextValue:FTextArea;
      
      private var ftNeedLingli:FTextArea;
      
      private var ftHaveLingli:FTextArea;
      
      private var ftGoodName:FTextArea;
      
      private var ftLingliqiu:FTextArea;
      
      private var btnLingliIn:SecondButton;
      
      private var btnLingliAuto:SecondButton;
      
      private var btnDesc:SecondButton;
      
      private var btnBuy:SecondButton;
      
      private var item:ItemFace;
      
      private var nowLV:int;
      
      private var fbID:int;
      
      private var goodID:int;
      
      private var mc:MovieClip;
      
      private var mcSpr:Sprite;
      
      private var swf1:MovieClip;
      
      private var swfSpr1:Sprite;
      
      private var swf2:MovieClip;
      
      private var swfSpr2:Sprite;
      
      private var swfArr:Array = [];
      
      private var swfArr1:Array = [];
      
      private var loadUrl1:String = "";
      
      private var loadUrl2:String = "";
      
      public function FabaoTupoPanel()
      {
         super();
         titleText = LanResManager.getLanCommonTextWords("法宝修炼");
         width = 668;
         height = 358;
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:DisplayObject = null;
         this.swfArr = new Array();
         this.swfArr1 = new Array();
         _loc1_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/fabao/fbTupo_bg.jpg",649,311);
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 305;
         this.ft.y = 180;
         this.ft.width = 100;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.text = LanResManager.getLanCommonTextWords("灵力满值时");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 295;
         this.ft.y = 200;
         this.ft.width = 100;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.text = LanResManager.getLanCommonTextWords("法宝会进阶品级");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 395;
         this.ft.y = 230;
         this.ft.width = 100;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.text = LanResManager.getLanCommonTextWords("灌注需要");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 110;
         this.ft.y = 4;
         this.ft.width = 100;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("本品效果");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 505;
         this.ft.y = 4;
         this.ft.width = 100;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("升品后效果");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 340;
         this.ft.y = 250;
         this.ft.width = 100;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanCommonTextWords("拥有灵力：") + "<br>" + LanResManager.getLanCommonTextWords("所需灵力：") + "<br>" + LanResManager.getLanCommonTextWords("道具名称：") + "</textformat>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 16;
         this.ft.y = 235;
         this.ft.width = 105;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.height = 90;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<textformat leading=\'7\'>" + LanResManager.getLanCommonTextWords("法宝攻击灵气：") + "<br>" + LanResManager.getLanCommonTextWords("法宝护体罡气：") + "<br>" + LanResManager.getLanCommonTextWords("法宝命脉内息：") + "<br>" + LanResManager.getLanCommonTextWords("法宝潜力爆发：") + "</textformat>";
         addChild(this.ft);
         this.ftNowValue = new FTextArea();
         this.ftNowValue.x = 100;
         this.ftNowValue.y = 233;
         this.ftNowValue.width = 100;
         this.ftNowValue.textColor = StaticValue.YELLOW;
         this.ftNowValue.height = 100;
         this.ftNowValue.wordWrap = true;
         this.ftNowValue.htmlText = "<textformat leading=\'6\'>9999999999：<br>9999999999：<br>9999999999：<br>9999999999：</textformat>";
         addChild(this.ftNowValue);
         this.ftNextValue = new FTextArea();
         this.ftNextValue.x = 245;
         this.ftNextValue.y = 233;
         this.ftNextValue.width = 100;
         this.ftNextValue.textColor = StaticValue.GREEN;
         this.ftNextValue.height = 100;
         this.ftNextValue.wordWrap = true;
         this.ftNextValue.htmlText = "<textformat leading=\'6\'>9999999999：<br>9999999999：<br>9999999999：<br>9999999999：</textformat>";
         addChild(this.ftNextValue);
         this.ftHaveLingli = new FTextArea();
         this.ftHaveLingli.x = 400;
         this.ftHaveLingli.y = 250;
         this.ftHaveLingli.width = 100;
         this.ftHaveLingli.textColor = StaticValue.YELLOW;
         this.ftHaveLingli.height = 20;
         this.ftHaveLingli.htmlText = "99999999";
         addChild(this.ftHaveLingli);
         this.ftNeedLingli = new FTextArea();
         this.ftNeedLingli.x = 400;
         this.ftNeedLingli.y = 272;
         this.ftNeedLingli.width = 100;
         this.ftNeedLingli.textColor = StaticValue.YELLOW;
         this.ftNeedLingli.height = 20;
         this.ftNeedLingli.htmlText = "99999999";
         addChild(this.ftNeedLingli);
         this.ftGoodName = new FTextArea();
         this.ftGoodName.x = 400;
         this.ftGoodName.y = 292;
         this.ftGoodName.width = 100;
         this.ftGoodName.textColor = StaticValue.YELLOW;
         this.ftGoodName.height = 20;
         this.ftGoodName.htmlText = LanResManager.getLanCommonTextWords("道具*999");
         addChild(this.ftGoodName);
         this.btnLingliIn = new SecondButton();
         this.btnLingliIn.x = 585;
         this.btnLingliIn.y = 235;
         this.btnLingliIn.label = LanResManager.getLanCommonTextWords("灵力灌注");
         this.btnLingliIn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnLingliIn);
         this.btnLingliAuto = new SecondButton();
         this.btnLingliAuto.x = 585;
         this.btnLingliAuto.y = 260;
         this.btnLingliAuto.label = LanResManager.getLanCommonTextWords("自动灌注");
         this.btnLingliAuto.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnLingliAuto);
         this.btnDesc = new SecondButton();
         this.btnDesc.x = 585;
         this.btnDesc.y = 285;
         this.btnDesc.label = LanResManager.getLanCommonTextWords("灌注说明");
         this.btnDesc.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnDesc);
         this.btnBuy = new SecondButton();
         this.btnBuy.x = 508;
         this.btnBuy.y = 285;
         this.btnBuy.label = LanResManager.getLanCommonTextWords("购买道具");
         this.btnBuy.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnBuy);
         var _loc2_:Bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 520;
         _loc2_.y = 235;
         addChild(_loc2_);
         this.mcSpr = new Sprite();
         addChild(this.mcSpr);
         this.ftLingliqiu = new FTextArea();
         this.ftLingliqiu.y = 110;
         this.ftLingliqiu.textColor = StaticValue.WHITE;
         this.ftLingliqiu.height = 20;
         this.ftLingliqiu.htmlText = "99999/99999";
         this.ftLingliqiu.x = 675 / 2 - this.ftLingliqiu.textWidth / 2;
         addChild(this.ftLingliqiu);
         this.swfSpr1 = new Sprite();
         this.swfSpr1.x = 85;
         this.swfSpr1.y = 40;
         addChild(this.swfSpr1);
         this.swfSpr2 = new Sprite();
         this.swfSpr2.x = 485;
         this.swfSpr2.y = 40;
         addChild(this.swfSpr2);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         switch(param1.target)
         {
            case this.btnBuy:
               this.$parent.dispatchEvent(new BaseEvent(FabaoPanel.UI_LINGLIGUANZHU_BUY_CLICK,"",this.goodID));
               break;
            case this.btnDesc:
               this.$parent.dispatchEvent(new BaseEvent(FabaoPanel.UI_LINGLIGUANZHU_DESC_CLICK));
               break;
            case this.btnLingliAuto:
               _loc2_ = false;
               if(this.btnLingliAuto.label == LanResManager.getLanCommonTextWords("自动灌注"))
               {
                  _loc2_ = true;
               }
               else
               {
                  _loc2_ = false;
               }
               this.$parent.dispatchEvent(new BaseEvent(FabaoPanel.UI_LINGLIGUANZHU_AUTO_CLICK,"",[_loc2_,this.nowLV,this.fbID]));
               break;
            case this.btnLingliIn:
               this.$parent.dispatchEvent(new BaseEvent(FabaoPanel.UI_LINGLIGUANZHU_CLICK,"",[this.nowLV,this.fbID]));
         }
      }
      
      public function setData(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int) : void
      {
         this.nowLV = param9;
         this.fbID = param10;
         this.goodID = param5;
         var _loc13_:Array = [];
         _loc13_ = param1.split(",");
         this.ftNowValue.htmlText = "<textformat leading=\'7\'>" + _loc13_[0] + "<br>" + _loc13_[1] + "<br>" + _loc13_[2] + "<br>" + _loc13_[3] + "</textformat>";
         _loc13_ = param2.split(",");
         this.ftNextValue.htmlText = "<textformat leading=\'7\'>" + _loc13_[0] + "<br>" + _loc13_[1] + "<br>" + _loc13_[2] + "<br>" + _loc13_[3] + "</textformat>";
         this.ftHaveLingli.htmlText = String(param3);
         this.ftNeedLingli.htmlText = String(param4);
         var _loc14_:uint = uint(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(param5,true));
         var _loc15_:Goods = new Goods(param5);
         _loc15_.count = _loc14_;
         this.ftGoodName.htmlText = _loc15_.res.name + " * " + param6;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(_loc15_);
         this.item.x = 522;
         this.item.y = 237;
         this.item.setShowCount(true);
         addChild(this.item);
         this.ftLingliqiu.htmlText = param7 + "/" + param8;
         this.ftLingliqiu.x = 675 / 2 - this.ftLingliqiu.textWidth / 2;
         this.setSwf1(param9,param12);
         this.setSwf2(param11,param12);
      }
      
      public function setBtnAuto(param1:Boolean) : void
      {
         if(param1)
         {
            this.btnLingliAuto.label = LanResManager.getLanCommonTextWords("自动灌注");
         }
         else
         {
            this.btnLingliAuto.label = LanResManager.getLanCommonTextWords("停止灌注");
         }
      }
      
      public function setQiu(param1:int) : void
      {
         while(this.mcSpr.numChildren > 0)
         {
            this.mcSpr.removeChildAt(0);
         }
         this.mc = StaticValue.getMCByClassName("ui.fabao.lingliqiu") as MovieClip;
         this.mcSpr.addChild(this.mc);
         this.mc.x = 290;
         this.mc.y = 60;
         this.mc.gotoAndStop(param1);
      }
      
      public function setSwf1(param1:int, param2:int) : void
      {
         var imgID:String = null;
         var lv:int = param1;
         var icoID:int = param2;
         var l:int = 0;
         if(lv <= 2)
         {
            l = 1;
         }
         else if(lv == 3 || lv == 4)
         {
            l = 2;
         }
         else
         {
            l = 3;
         }
         imgID = icoID + "" + l;
         this.loadUrl1 = GameConfig.fileBaseFolder + "res/ui/UIditu/fabao/big/" + icoID + "_" + l + ".swf";
         if(Boolean(this.swf1) && this.swf1.parent != null)
         {
            this.swf1.stop();
            this.swf1.parent.removeChild(this.swf1);
         }
         while(this.swfSpr1.numChildren > 0)
         {
            this.swfSpr1.removeChildAt(0);
         }
         if(this.swfArr1[int(imgID)] != null)
         {
            this.swf1 = this.swfArr1[int(imgID)];
            this.swf1.play();
            this.swfSpr1.addChild(this.swf1);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl1)
               {
                  return;
               }
               if(Boolean(swf1) && swf1.parent != null)
               {
                  swf1.stop();
                  swf1.parent.removeChild(swf1);
               }
               while(swfSpr1.numChildren > 0)
               {
                  swfSpr1.removeChildAt(0);
               }
               swf1 = _loc2_.content as MovieClip;
               swfArr1[int(imgID)] = swf1;
               if(swf1)
               {
                  swfSpr1.addChild(swf1);
               }
            },null,false,this.loadUrl1);
         }
      }
      
      public function setSwf2(param1:int, param2:int) : void
      {
         var imgID:String = null;
         var lv:int = param1;
         var icoID:int = param2;
         var l:int = 0;
         if(lv <= 2)
         {
            l = 1;
         }
         else if(lv == 3 || lv == 4)
         {
            l = 2;
         }
         else
         {
            l = 3;
         }
         this.loadUrl2 = GameConfig.fileBaseFolder + "res/ui/UIditu/fabao/big/" + icoID + "_" + l + ".swf";
         if(Boolean(this.swf2) && this.swf2.parent != null)
         {
            this.swf2.stop();
            this.swf2.parent.removeChild(this.swf2);
         }
         while(this.swfSpr2.numChildren > 0)
         {
            this.swfSpr2.removeChildAt(0);
         }
         imgID = icoID + "" + l;
         if(this.swfArr[int(imgID)] != null)
         {
            this.swf2 = this.swfArr[int(imgID)];
            this.swf2.play();
            this.swfSpr2.addChild(this.swf2);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl2)
               {
                  return;
               }
               if(Boolean(swf2) && swf2.parent != null)
               {
                  swf2.stop();
                  swf2.parent.removeChild(swf2);
               }
               while(swfSpr2.numChildren > 0)
               {
                  swfSpr2.removeChildAt(0);
               }
               swf2 = _loc2_.content as MovieClip;
               swfArr[int(imgID)] = swf2;
               if(swf2)
               {
                  swfSpr2.addChild(swf2);
               }
            },null,false,this.loadUrl2);
         }
      }
   }
}

