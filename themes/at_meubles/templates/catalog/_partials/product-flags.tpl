{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<!-- {block name='product_flags'}
    <ul class="product-flags">
        {foreach from=$product.flags item=flag}
            <li class="product-flag {$flag.type}">{$flag.label}</li>
        {/foreach}
    </ul>
{/block} -->
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