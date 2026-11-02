package com.tgame.shell.view.components.qicaipaihangbang
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.Label;
   import game.display.SimpleButton;
   import game.skin.TiJiaoWuPinSkin;
   import game.utils.SkinTools;
   
   public class QicaitijiaowupinPanel extends BasePanel
   {
      
      private var guanbi:SimpleButton;
      
      private var tijiao1:SimpleButton;
      
      private var tijiao2:SimpleButton;
      
      private var tijiao3:SimpleButton;
      
      private var tijiao4:SimpleButton;
      
      private var tijiao5:SimpleButton;
      
      private var huodongtime:Label;
      
      private var huodongtime2:Label;
      
      private var lingjiangtime:Label;
      
      private var lingjiangtime2:Label;
      
      private var wupin1:Label;
      
      private var wupin2:Label;
      
      private var wupin3:Label;
      
      private var wupin4:Label;
      
      private var wupin5:Label;
      
      private var labelsp1:Container;
      
      private var labelsp2:Container;
      
      private var labelsp3:Container;
      
      private var labelsp4:Container;
      
      public function QicaitijiaowupinPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(TiJiaoWuPinSkin.skin,"tijiaowupin");
      }
      
      override protected function createVariableReference() : void
      {
         var _loc3_:ItemFace = null;
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.onClose);
         this.tijiao1 = getChildByName("tijiao1") as SimpleButton;
         this.tijiao1.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.tijiao2 = getChildByName("tijiao2") as SimpleButton;
         this.tijiao2.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.tijiao3 = getChildByName("tijiao3") as SimpleButton;
         this.tijiao3.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.tijiao4 = getChildByName("tijiao4") as SimpleButton;
         this.tijiao4.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.tijiao5 = getChildByName("tijiao5") as SimpleButton;
         this.tijiao5.addEventListener(MouseEvent.CLICK,this.clickfunction);
         this.huodongtime = getChildByName("huodongshijianbiaoti") as Label;
         this.huodongtime.text = LanResManager.getLanCommonTextWords("活动时间");
         this.labelsp1 = getChildByName("huodongshijianwenben") as Container;
         this.labelsp2 = this.labelsp1.getChildByName("mynormal") as Container;
         this.huodongtime2 = this.labelsp2.getChildByName("huodongshijianwenben") as Label;
         this.huodongtime2.text = LanResManager.getLanCommonTextWords("2016年9月2号（0点） - 2016年09月7号（23点59）");
         this.lingjiangtime = getChildByName("jieshushijianbiaoti") as Label;
         this.lingjiangtime.text = LanResManager.getLanCommonTextWords("领奖时间");
         this.labelsp3 = getChildByName("jieshushijianwenben") as Container;
         this.labelsp4 = this.labelsp3.getChildByName("mynormal") as Container;
         this.lingjiangtime2 = this.labelsp4.getChildByName("jieshushijianwenben") as Label;
         this.lingjiangtime2.text = LanResManager.getLanCommonTextWords("2016年9月8号（0点） - 2016年09月7号（23点59）");
         this.wupin1 = getChildByName("wenben16") as Label;
         this.wupin2 = getChildByName("wenben17") as Label;
         this.wupin3 = getChildByName("wenben18") as Label;
         this.wupin4 = getChildByName("wenben19") as Label;
         this.wupin5 = getChildByName("wenben20") as Label;
         this.wupin1.text = LanResManager.getLanCommonTextWords("提交甲衣");
         this.wupin2.text = LanResManager.getLanCommonTextWords("提交战旗");
         this.wupin3.text = LanResManager.getLanCommonTextWords("提交战马");
         this.wupin4.text = LanResManager.getLanCommonTextWords("提交铁盾");
         this.wupin5.text = LanResManager.getLanCommonTextWords("提交弓箭");
         var _loc1_:Array = [726100,726101,726102,726103,726104];
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = new ItemFace(new Goods(_loc1_[_loc2_]));
            addChild(_loc3_);
            _loc3_.x = 35;
            _loc3_.y = 177 + _loc2_ * 53;
            _loc2_++;
         }
      }
      
      protected function clickfunction(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.tijiao1:
               dispatchEvent(new BaseEvent(YN2016QicaiPaihangbangPanel.TIJIAOWUPIN,"",1));
               break;
            case this.tijiao2:
               dispatchEvent(new BaseEvent(YN2016QicaiPaihangbangPanel.TIJIAOWUPIN,"",2));
               break;
            case this.tijiao3:
               dispatchEvent(new BaseEvent(YN2016QicaiPaihangbangPanel.TIJIAOWUPIN,"",3));
               break;
            case this.tijiao4:
               dispatchEvent(new BaseEvent(YN2016QicaiPaihangbangPanel.TIJIAOWUPIN,"",4));
               break;
            case this.tijiao5:
               dispatchEvent(new BaseEvent(YN2016QicaiPaihangbangPanel.TIJIAOWUPIN,"",5));
         }
      }
      
      override public function onClose(param1:* = null) : void
      {
         super.onClose();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

