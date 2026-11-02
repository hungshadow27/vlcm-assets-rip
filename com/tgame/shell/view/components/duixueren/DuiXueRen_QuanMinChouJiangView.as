package com.tgame.shell.view.components.duixueren
{
   import com.fireice.text.FLabel;
   import com.greensock.TweenLite;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import gs.easing.Quad;
   
   public class DuiXueRen_QuanMinChouJiangView extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var goodsArr:Array;
      
      private var goodsContainer:Sprite;
      
      private var txtJinPiaoCount:FLabel;
      
      private var txtYuanBaoCount:FLabel;
      
      private var txtJinTiaoCount:FLabel;
      
      private var txtJinPiao:FLabel;
      
      private var txtYuanBao:FLabel;
      
      private var txtJinTiao:FLabel;
      
      private var btnKaiShi:NewSkinButton;
      
      private var btnLingQu:NewSkinButton;
      
      private var btnJinPiao:SecondButton;
      
      private var btnYuanBao:SecondButton;
      
      private var btnJinTiao:SecondButton;
      
      private var lineSpr:Sprite;
      
      private var txtTip:FLabel;
      
      private var currButton:SecondButton;
      
      private var type:int = 0;
      
      private var curIndex:int;
      
      public function DuiXueRen_QuanMinChouJiangView()
      {
         var bg:DisplayObject;
         var bg2:DisplayObject;
         var line:DisplayObject;
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duixueren/3/bg.swf");
         bg.x = 10;
         bg.y = 2;
         addChild(bg);
         bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duixueren/3/bg2.swf");
         bg2.x = 90;
         bg2.y = 10;
         addChild(bg2);
         this.goodsContainer = new Sprite();
         addChild(this.goodsContainer);
         this.lineSpr = new Sprite();
         addChild(this.lineSpr);
         this.lineSpr.x = 320 - 2;
         this.lineSpr.y = 300 + 13 - 88;
         this.txtJinPiaoCount = new FLabel();
         this.txtJinPiaoCount.textColor = StaticValue.GOLD;
         this.txtJinPiaoCount.filters = StaticValue.filter;
         this.txtJinPiaoCount.x = 20;
         this.txtJinPiaoCount.y = 20;
         addChild(this.txtJinPiaoCount);
         this.txtYuanBaoCount = new FLabel();
         this.txtYuanBaoCount.textColor = StaticValue.GREEN;
         this.txtYuanBaoCount.filters = StaticValue.filter;
         this.txtYuanBaoCount.x = 20;
         this.txtYuanBaoCount.y = 38;
         addChild(this.txtYuanBaoCount);
         this.txtJinTiaoCount = new FLabel();
         this.txtJinTiaoCount.textColor = StaticValue.WHITE;
         this.txtJinTiaoCount.filters = StaticValue.filter;
         this.txtJinTiaoCount.x = 20;
         this.txtJinTiaoCount.y = 56;
         addChild(this.txtJinTiaoCount);
         this.txtJinPiao = new FLabel();
         this.txtJinPiao.textColor = StaticValue.GOLD;
         this.txtJinPiao.filters = StaticValue.filter;
         this.txtJinPiao.x = 240;
         this.txtJinPiao.y = 470;
         addChild(this.txtJinPiao);
         this.txtYuanBao = new FLabel();
         this.txtYuanBao.textColor = StaticValue.GREEN;
         this.txtYuanBao.filters = StaticValue.filter;
         this.txtYuanBao.x = 240;
         this.txtYuanBao.y = 488;
         addChild(this.txtYuanBao);
         this.txtJinTiao = new FLabel();
         this.txtJinTiao.textColor = StaticValue.WHITE;
         this.txtJinTiao.filters = StaticValue.filter;
         this.txtJinTiao.x = 240;
         this.txtJinTiao.y = 506;
         addChild(this.txtJinTiao);
         line = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/quanmingfuli/choujiang/jiantou.swf");
         line.x = 37 - 40 - 10 - 5 + 2;
         line.y = -30 - 20 - 50;
         this.lineSpr.addChild(line);
         this.btnKaiShi = new NewSkinButton();
         this.btnKaiShi.skin = "qmcj_1_Button";
         this.btnKaiShi.x = 263;
         this.btnKaiShi.y = 184;
         addChild(this.btnKaiShi);
         this.btnKaiShi.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu = new NewSkinButton();
         this.btnLingQu.skin = "qmcj_2_Button";
         this.btnLingQu.x = 263;
         this.btnLingQu.y = 184;
         addChild(this.btnLingQu);
         this.btnLingQu.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnJinPiao = new SecondButton();
         this.btnJinPiao.label = "金票抽奖";
         this.btnJinPiao.x = 550;
         this.btnJinPiao.y = 200;
         addChild(this.btnJinPiao);
         this.btnJinPiao.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnYuanBao = new SecondButton();
         this.btnYuanBao.label = "元宝抽奖";
         this.btnYuanBao.x = 550;
         this.btnYuanBao.y = 225;
         addChild(this.btnYuanBao);
         this.btnYuanBao.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnJinTiao = new SecondButton();
         this.btnJinTiao.label = "金条抽奖";
         this.btnJinTiao.x = 550;
         this.btnJinTiao.y = 250;
         addChild(this.btnJinTiao);
         this.btnJinTiao.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.currButton = this.btnJinPiao;
         this.txtTip = new FLabel();
         this.txtTip.textColor = StaticValue.RED;
         this.txtTip.filters = StaticValue.filter;
         this.txtTip.text = "玩法说明";
         this.txtTip.x = 510;
         this.txtTip.y = 20;
         addChild(this.txtTip);
         ToolTips.createToolTips(this.txtTip,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "抽奖分为三种类型 金票、元宝、金条都可以抽奖，" + "<br>" + "不同类型抽到的奖励不同每种每日最多可抽20次，" + "<br>" + "每次抽奖消耗的 金票1亿、元宝500、金条200，" + "<br>" + "点击【金票抽奖】【元宝抽奖】【金条抽奖】 来确定抽奖类型，" + "<br>" + "除石头外其余道具均不绑定。" + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.btnKaiShi:
               this.$parent.dispatchEvent(new BaseEvent(DuiXueRenPanel.QUANMINGCHOUJIANG_KAISHI,"",this.type));
               break;
            case this.btnLingQu:
               this.$parent.dispatchEvent(new BaseEvent(DuiXueRenPanel.QUANMINGCHOUJIANG_LIANGQU,"",this.type));
               break;
            case this.btnJinPiao:
               this.$parent.dispatchEvent(new BaseEvent(DuiXueRenPanel.QUANMINGCHOUJIANG,"",1));
               break;
            case this.btnYuanBao:
               this.$parent.dispatchEvent(new BaseEvent(DuiXueRenPanel.QUANMINGCHOUJIANG,"",2));
               break;
            case this.btnJinTiao:
               this.$parent.dispatchEvent(new BaseEvent(DuiXueRenPanel.QUANMINGCHOUJIANG,"",3));
         }
      }
      
      public function setQuanMinChouJiangData(param1:int = 0, param2:Object = null, param3:Array = null, param4:int = 0, param5:int = 0) : void
      {
         var _loc7_:ItemFace = null;
         this.type = param1;
         var _loc6_:int = 0;
         this.currButton.enabled = true;
         switch(param1)
         {
            case 1:
               _loc6_ = int(param2.jinPiaoCount);
               this.currButton = this.btnJinPiao;
               break;
            case 2:
               _loc6_ = int(param2.yuanBaoCount);
               this.currButton = this.btnYuanBao;
               break;
            case 3:
               _loc6_ = int(param2.jinTiaoCount);
               this.currButton = this.btnJinTiao;
         }
         this.currButton.enabled = false;
         this.txtJinPiaoCount.text = "金票抽奖次数：" + param2.jinPiaoCount + "/20";
         this.txtYuanBaoCount.text = "元宝抽奖次数：" + param2.yuanBaoCount + "/20";
         this.txtJinTiaoCount.text = "金条抽奖次数：" + param2.jinTiaoCount + "/20";
         this.txtJinPiao.text = "金票数量：" + param2.jinPiao;
         this.txtYuanBao.text = "元宝数量：" + param2.yuanBao;
         this.txtJinTiao.text = "金条数量：" + param2.jinTiao;
         this.setGoods(param3);
         if(param4)
         {
            this.btnKaiShi.visible = false;
            this.btnLingQu.visible = true;
            this.lineSpr.rotation = param5 * 18 + 9;
            this.curIndex = param5;
            _loc7_ = this.goodsContainer.getChildByName("" + param5) as ItemFace;
            _loc7_.showGiftSelect(true);
         }
         else
         {
            if(_loc6_)
            {
               this.btnKaiShi.enabled = true;
            }
            this.btnKaiShi.visible = true;
            this.btnLingQu.visible = false;
            this.lineSpr.rotation = 0;
         }
      }
      
      public function setTurnData(param1:Object, param2:int) : void
      {
         if(!param2)
         {
            return;
         }
         this.setTurn(param2);
      }
      
      public function setTurn(param1:int = 0, param2:int = 5, param3:int = 1440) : void
      {
         var _loc4_:ItemFace = null;
         this.btnKaiShi.enabled = false;
         this.lineSpr.rotation = 0;
         if(this.curIndex)
         {
            _loc4_ = this.goodsContainer.getChildByName("" + this.curIndex) as ItemFace;
            _loc4_.showGiftSelect(false);
         }
         this.curIndex = param1;
         TweenLite.to(this.lineSpr,param2,{
            "rotation":param3 + param1 * 18 + 9,
            "onComplete":this.setStartButton,
            "ease":Quad.easeInOut
         });
      }
      
      public function setStartButton(param1:Boolean = false) : void
      {
         this.btnKaiShi.visible = false;
         this.btnLingQu.visible = true;
         var _loc2_:ItemFace = this.goodsContainer.getChildByName("" + this.curIndex) as ItemFace;
         _loc2_.showGiftSelect(!param1);
      }
      
      public function setGoods(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         this.goodsArr = new Array();
         this.goodsArr = param1;
         while(this.goodsContainer.numChildren > 0)
         {
            this.goodsContainer.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new Goods(param1[_loc2_].goodsID);
            _loc3_.count = param1[_loc2_].goodsNum;
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.name = param1[_loc2_].goodsIndex + "";
            switch(param1[_loc2_].goodsIndex)
            {
               case 0:
                  _loc4_.x = 325;
                  _loc4_.y = 49;
                  break;
               case 1:
                  _loc4_.x = 375;
                  _loc4_.y = 68;
                  break;
               case 2:
                  _loc4_.x = 420;
                  _loc4_.y = 98;
                  break;
               case 3:
                  _loc4_.x = 455;
                  _loc4_.y = 141;
                  break;
               case 4:
                  _loc4_.x = 473;
                  _loc4_.y = 192;
                  break;
               case 5:
                  _loc4_.x = 473;
                  _loc4_.y = 246;
                  break;
               case 6:
                  _loc4_.x = 455;
                  _loc4_.y = 297;
                  break;
               case 7:
                  _loc4_.x = 420;
                  _loc4_.y = 340;
                  break;
               case 8:
                  _loc4_.x = 378;
                  _loc4_.y = 374;
                  break;
               case 9:
                  _loc4_.x = 325;
                  _loc4_.y = 393;
                  break;
               case 10:
                  _loc4_.x = 274;
                  _loc4_.y = 393;
                  break;
               case 11:
                  _loc4_.x = 222;
                  _loc4_.y = 374;
                  break;
               case 12:
                  _loc4_.x = 178;
                  _loc4_.y = 340;
                  break;
               case 13:
                  _loc4_.x = 143;
                  _loc4_.y = 297;
                  break;
               case 14:
                  _loc4_.x = 125;
                  _loc4_.y = 246;
                  break;
               case 15:
                  _loc4_.x = 125;
                  _loc4_.y = 192;
                  break;
               case 16:
                  _loc4_.x = 143;
                  _loc4_.y = 141;
                  break;
               case 17:
                  _loc4_.x = 178;
                  _loc4_.y = 98;
                  break;
               case 18:
                  _loc4_.x = 223;
                  _loc4_.y = 68;
                  break;
               case 19:
                  _loc4_.x = 274;
                  _loc4_.y = 49;
            }
            this.goodsContainer.addChild(_loc4_);
            _loc2_++;
         }
      }
   }
}

