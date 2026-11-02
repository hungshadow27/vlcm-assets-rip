package com.tgame.shell.view.components.baoshijianshang
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class BaoShiJianShangGuiZeJieShaoPanel extends FPanel
   {
      
      private var jieshao:FTextArea;
      
      private var zhuyi:FTextArea;
      
      public function BaoShiJianShangGuiZeJieShaoPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 300;
         height = 300;
         this.addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.titleText = LanResManager.getLanCommonTextWords("鉴赏规则");
         this.jieshao = new FTextArea();
         this.jieshao.width = 260;
         this.jieshao.height = 300;
         this.jieshao.wordWrap = true;
         this.jieshao.x = 20;
         this.jieshao.y = 8;
         this.jieshao.filters = StaticValue.filter;
         this.jieshao.textColor = StaticValue.YELLOW;
         this.jieshao.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("您需要使用“鉴宝令”作为鉴宝凭证（商城有售），然后在宝石鉴赏界面选择您预测开出的宝石种类。第一个确定了预测结果的玩家将会开启鉴宝倒计时，分钟后，万宝阁中会刷新一块矿石，攻击矿石，待其破裂后即可剖出其中的宝石。如果剖出的宝石与您之前预测的相同，则可以领取相应倍率的商城金票作为奖励。") + "</textformat>";
         this.addChild(this.jieshao);
         this.zhuyi = new FTextArea();
         this.zhuyi.width = 260;
         this.zhuyi.wordWrap = true;
         this.zhuyi.x = 20;
         this.zhuyi.y = 145;
         this.jieshao.filters = StaticValue.filter;
         this.zhuyi.textColor = StaticValue.RED;
         this.zhuyi.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("注意：商城金票与元宝一样，可以购买商城物品，但不能参与玩家交易。当玩家同时拥有金票和元宝时，自动优先使用金票来购买物品。") + "</textformat>";
         this.addChild(this.zhuyi);
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

