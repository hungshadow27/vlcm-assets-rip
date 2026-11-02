package com.tgame.shell.view.components.duixueren
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class DuiXueRen_DuiXueRenView extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var boxContainer:Sprite;
      
      private var txtNum:FLabel;
      
      private var txtMiaoShu:FTextArea;
      
      private var btnSub:SecondButton;
      
      public function DuiXueRen_DuiXueRenView()
      {
         super();
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duixueren/1/bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         this.txtNum = new FLabel();
         this.txtNum.textColor = StaticValue.WHITE;
         this.txtNum.filters = StaticValue.filter;
         this.txtNum.x = 20;
         this.txtNum.y = 415;
         addChild(this.txtNum);
         this.txtMiaoShu = new FTextArea();
         this.txtMiaoShu.textColor = StaticValue.GOLD;
         this.txtMiaoShu.filters = StaticValue.filter;
         this.txtMiaoShu.x = 15;
         this.txtMiaoShu.y = 137;
         this.txtMiaoShu.width = 605;
         this.txtMiaoShu.height = 260;
         var _loc2_:String = "";
         _loc2_ += "<textformat leading=\'6\'>";
         _loc2_ += "<font color=\'StaticValue.GOLD_HTML\'>" + LanResManager.getLanCommonTextWords("活动时间：12月1日00:00-12月30日22:00") + "<br>" + LanResManager.getLanCommonTextWords("在全世界打怪有几率掉落雪人礼包和雪人，不同职业双击使用雪人礼包可随机获得一种堆雪人的道具；") + "<br>" + LanResManager.getLanCommonTextWords("雪人可在襄阳城一线二线使用，使用后刷出一个雪人，所有玩家均可点击雪人来提交道具，雪人每晚12点清除；") + "<br>" + LanResManager.getLanCommonTextWords("每种道具每个雪人只可提交一次，每提交一个道具均可获得2点堆雪人积分， ") + "<br>" + LanResManager.getLanCommonTextWords("当雪人提交满之后，雪人的拥有者将获得10点堆雪人积分；") + "<br>" + LanResManager.getLanCommonTextWords("每个玩家每次最多可使用3个雪人，每天最多使用10个雪人，提交道具无次数限制；") + "<br>" + LanResManager.getLanCommonTextWords("襄阳城一线二线每天的10时、12时、14时、16时、18时将会刷一批雪人寻宝鼠，") + "<br>" + LanResManager.getLanCommonTextWords("击杀后掉落大量堆雪人道具；") + "<br>" + LanResManager.getLanCommonTextWords("积分可用来兑换道具，第一个道具可无限兑换，道具双击使用提交排行榜获得雪人积分，活动结束后") + "<br>" + LanResManager.getLanCommonTextWords("1-3名可获得缤纷雪人换装（永久版）") + "<br>" + LanResManager.getLanCommonTextWords("4-10名可获得缤纷雪人换装（30天）") + "<br>" + LanResManager.getLanCommonTextWords("11-100名可获得缤纷雪人换装（15天）") + "<br>" + LanResManager
         .getLanCommonTextWords("101名之后可获得缤纷雪人换装（7天）") + "<br>";
         _loc2_ += "</textformat>";
         this.txtMiaoShu.htmlText = _loc2_;
         addChild(this.txtMiaoShu);
      }
      
      public function setDuiXueRenData(param1:int = 0, param2:Array = null) : void
      {
         var _loc3_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:ItemFace = null;
         var _loc7_:FTextArea = null;
         var _loc8_:TextFormat = null;
         var _loc9_:SecondButton = null;
         this.txtNum.text = LanResManager.getLanCommonTextWords("堆雪人积分：") + param1;
         this.removeContainerBoxChildren();
         _loc3_ = 0;
         _loc3_ = 0;
         while(_loc3_ < param2.length)
         {
            _loc7_ = new FTextArea();
            _loc7_.width = 100;
            _loc8_ = new TextFormat();
            _loc8_.align = "center";
            _loc7_.defaultTextFormat = _loc8_;
            _loc7_.textColor = StaticValue.WHITE;
            _loc7_.filters = StaticValue.filter;
            _loc7_.text = param2[_loc3_].num + "";
            _loc7_.x = _loc3_ * 58;
            _loc7_.y = 445;
            _loc7_.mouseEnabled = false;
            this.boxContainer.addChild(_loc7_);
            _loc5_ = new Goods(param2[_loc3_].goodsID);
            _loc5_.count = param2[_loc3_].goodsNum;
            _loc6_ = new ItemFace(_loc5_);
            _loc6_.x = _loc3_ * 58 + 34;
            _loc6_.y = 465;
            this.boxContainer.addChild(_loc6_);
            _loc9_ = new SecondButton();
            _loc9_.label = LanResManager.getLanCommonTextWords("兑换");
            _loc9_.x = _loc3_ * 58 + 30;
            _loc9_.y = 505;
            _loc9_.name = _loc3_ + "";
            this.boxContainer.addChild(_loc9_);
            _loc9_.addEventListener(MouseEvent.CLICK,this.onClickDuiHuan1Handler);
            _loc9_.enabled = Boolean(param2[_loc3_].hasConversion);
            _loc3_++;
         }
         var _loc4_:FTextArea = new FTextArea();
         _loc4_.x = 500;
         _loc4_.y = 445;
         _loc4_.textColor = StaticValue.WHITE;
         _loc4_.width = 120;
         _loc4_.htmlText = LanResManager.getLanCommonTextWords("包裹内拥有血狮玉：");
         _loc5_ = new Goods(724598);
         _loc5_.count = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(724598,true);
         _loc6_ = new ItemFace(_loc5_);
         _loc6_.x = 525;
         _loc6_.y = 465;
         _loc6_.setShowCount(true);
         this.btnSub = new SecondButton();
         this.btnSub.label = LanResManager.getLanCommonTextWords("提交");
         this.btnSub.x = 525;
         this.btnSub.y = 505;
         this.btnSub.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[49]);
      }
      
      private function onClickDuiHuan1Handler(param1:MouseEvent) : void
      {
         param1.currentTarget.name;
         this.$parent.dispatchEvent(new BaseEvent(DuiXueRenPanel.DUIXUEREN_DUIHUAN_CLICK,"",int(param1.currentTarget.name)));
      }
      
      private function removeContainerBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
   }
}

