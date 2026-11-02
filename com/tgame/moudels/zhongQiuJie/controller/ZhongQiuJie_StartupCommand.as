package com.tgame.moudels.zhongQiuJie.controller
{
   import com.tgame.moudels.zhongQiuJie.model.ZhongQiuJie_MsgReceivedProxy;
   import com.tgame.moudels.zhongQiuJie.model.ZhongQiuJie_MsgSendProxy;
   import com.tgame.moudels.zhongQiuJie.view.CaiDengMi_Mediator;
   import com.tgame.moudels.zhongQiuJie.view.YuanXiaoJie_Mediator;
   import com.tgame.moudels.zhongQiuJie.view.ZhongQiuJieZhuoZi_Mediator;
   import com.tgame.moudels.zhongQiuJie.view.ZhongQiuJie_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ZhongQiuJie_StartupCommand extends SimpleCommand
   {
      
      public function ZhongQiuJie_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ZhongQiuJie_MsgReceivedProxy());
         facade.registerProxy(new ZhongQiuJie_MsgSendProxy());
         facade.registerMediator(new ZhongQiuJie_Mediator());
         facade.registerMediator(new ZhongQiuJieZhuoZi_Mediator());
         facade.registerMediator(new YuanXiaoJie_Mediator());
         facade.registerMediator(new CaiDengMi_Mediator());
      }
   }
}

