package com.tgame.shell.view.components.xingyunzhuanzhuanle
{
   import com.asQuery.$;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.systemculture.TipCanvas;
   import com.tgame.shell.view.components.utils.TipManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.display.Image;
   import game.display.List;
   import game.display.SimpleButton;
   import game.skin.DingFengYunPanSkin;
   import game.utils.SkinTools;
   import gs.TweenLite;
   import gs.easing.Quad;
   
   public class DingFengYunPanPanel extends BasePanel
   {
      
      public static const ZHUANPAN_KAISHI_BTN_CLICK:String = "ZHUANPAN_KAISHI_BTN_CLICK";
      
      public static const ZHUANPAN_LINGJIANG_BTN_CLICK:String = "ZHUANPAN_LINGJIANG_BTN_CLICK";
      
      private var line:DisplayObject;
      
      private var lineSpr:Sprite;
      
      private var goodsArr:Array;
      
      private var goodsContainer:Sprite;
      
      private var closeBtn:SimpleButton;
      
      private var kaishiBtn:SimpleButton;
      
      private var lingjiangBtn:SimpleButton;
      
      private var list:List;
      
      private var curIndex:int;
      
      public function DingFengYunPanPanel()
      {
         var str:String;
         var tipCanvas:TipCanvas = null;
         super();
         this.skin = SkinTools.getChildSkinByName(DingFengYunPanSkin.skin,"dingfengyunpan");
         this.lineSpr = new Sprite();
         addChild(this.lineSpr);
         this.lineSpr.x = 181;
         this.lineSpr.y = 186;
         this.line = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xingyunzhuanzhuanle/jiantou.swf");
         this.line.x = 37 - 40 - 10 - 5 + 2;
         this.line.y = -30 - 20 - 50;
         this.lineSpr.addChild(this.line);
         this.goodsContainer = new Sprite();
         this.goodsContainer.x = -116;
         this.goodsContainer.y = -22;
         addChild(this.goodsContainer);
         setChildIndex(this.kaishiBtn,numChildren - 1);
         setChildIndex(this.lingjiangBtn,numChildren - 2);
         str = "";
         tipCanvas = new TipCanvas(str,300);
         TipManager.regObj2HasTips($("wanfashuoming",this,true).getContainer(),null,false,function(param1:DisplayObject):TipCanvas
         {
            var _loc2_:String = "<textformat leading = \'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("顶峰云盘玩法说明1") + "<br>" + LanResManager.getLanCommonTextWords("顶峰云盘玩法说明2") + "<br>" + LanResManager.getLanCommonTextWords("顶峰云盘玩法说明3") + "<br>" + LanResManager.getLanCommonTextWords("顶峰云盘玩法说明4") + "<br>" + "</font></textformat>";
            tipCanvas.htmlText = _loc2_;
            return tipCanvas;
         });
      }
      
      override protected function createVariableReference() : void
      {
         this.closeBtn = getChildByName("guanbianniu") as SimpleButton;
         this.closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         this.kaishiBtn = getChildByName("choujiang") as SimpleButton;
         this.kaishiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingjiangBtn = getChildByName("lingjiang") as SimpleButton;
         this.lingjiangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         (getChildByName("zhizhen") as Image).visible = false;
         this.list = getChildByName("liebiao1") as List;
         this.list.ItemClass = DingFengYunPanRender;
         this.list.verticalGap = 5;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kaishiBtn:
               if(this.kaishiBtn.enabled)
               {
                  dispatchEvent(new BaseEvent(DingFengYunPanPanel.ZHUANPAN_KAISHI_BTN_CLICK));
               }
               break;
            case this.lingjiangBtn:
               dispatchEvent(new BaseEvent(DingFengYunPanPanel.ZHUANPAN_LINGJIANG_BTN_CLICK));
         }
      }
      
      public function setcishu(param1:int) : void
      {
         $("cishu",this,true).attr("text",LanResManager.getLanCommonTextWords("剩余次数") + "：" + param1);
      }
      
      public function setleiji(param1:int) : void
      {
      }
      
      public function setListData(param1:Array) : void
      {
         this.list.DataSource = param1;
      }
      
      public function setData(param1:Boolean, param2:int) : void
      {
         var _loc3_:ItemFace = null;
         if(param1)
         {
            this.kaishiBtn.visible = false;
            this.lingjiangBtn.visible = true;
            this.lineSpr.rotation = (param2 - 1) * 36;
            this.curIndex = param2;
            _loc3_ = this.goodsContainer.getChildByName("" + param2) as ItemFace;
            _loc3_.showGiftSelect(true);
         }
         else
         {
            this.kaishiBtn.visible = true;
            this.kaishiBtn.enabled = true;
            this.lingjiangBtn.visible = false;
            this.lineSpr.rotation = 0;
         }
      }
      
      public function setGoods(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         this.goodsArr = param1;
         if(this.goodsArr == null)
         {
            return;
         }
         while(this.goodsContainer.numChildren > 0)
         {
            this.goodsContainer.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new Goods(param1[_loc2_].goodId);
            _loc3_.count = param1[_loc2_].count;
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.name = param1[_loc2_].id;
            switch(param1[_loc2_].id)
            {
               case 1:
                  _loc4_.x = 278;
                  _loc4_.y = 68;
                  break;
               case 2:
                  _loc4_.x = 354;
                  _loc4_.y = 96;
                  break;
               case 3:
                  _loc4_.x = 394;
                  _loc4_.y = 160;
                  break;
               case 4:
                  _loc4_.x = 394;
                  _loc4_.y = 228;
                  break;
               case 5:
                  _loc4_.x = 349;
                  _loc4_.y = 287;
                  break;
               case 6:
                  _loc4_.x = 278;
                  _loc4_.y = 312;
                  break;
               case 7:
                  _loc4_.x = 203;
                  _loc4_.y = 287;
                  break;
               case 8:
                  _loc4_.x = 161;
                  _loc4_.y = 228;
                  break;
               case 9:
                  _loc4_.x = 161;
                  _loc4_.y = 160;
                  break;
               case 10:
                  _loc4_.x = 202;
                  _loc4_.y = 96;
            }
            this.goodsContainer.addChild(_loc4_);
            _loc2_++;
         }
      }
      
      public function setTurn(param1:int = 0, param2:int = 5, param3:int = 1440) : void
      {
         this.lineSpr.rotation = 0;
         this.curIndex = param1;
         this.kaishiBtn.enabled = false;
         this.kaishiBtn.visible = true;
         this.lingjiangBtn.visible = false;
         TweenLite.to(this.lineSpr,param2,{
            "rotation":param3 + (param1 - 1) * 36,
            "onComplete":this.setStartButton,
            "ease":Quad.easeInOut
         });
      }
      
      public function setStartButton(param1:Boolean = false) : void
      {
         this.kaishiBtn.visible = param1;
         this.lingjiangBtn.visible = !param1;
         var _loc2_:ItemFace = this.goodsContainer.getChildByName("" + this.curIndex) as ItemFace;
         _loc2_.showGiftSelect(!param1);
      }
   }
}

