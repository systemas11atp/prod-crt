{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright  2007-2018 Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{block name='product_flags'}
<ul class="product-flags">
  {foreach from=$product.flags item=flag}
	<li class="product-flag {$flag.type}">{$flag.label}</li>
  {/foreach}
  {block name='product_price_and_shipping'}
	{if $product.show_price}
		{if $product.has_discount}
			{if $product.discount_type === 'percentage'}
	          <li class="product-flag custom-discount discount-percentage">{$product.discount_percentage}</li>
	        {elseif $product.discount_type === 'amount'}
	          <li class="product-flag custom-discount discount-amount discount-product">{$product.discount_amount_to_display}</li>
	        {/if}
		{/if}
	{/if}
{/block}
</ul>
{/block}
