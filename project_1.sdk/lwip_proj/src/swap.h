/*
 * swap.h
 *
 *  Created on: Oct 7, 2016
 *      Author: alexander
 */

#ifndef SRC_SWAP_H_
#define SRC_SWAP_H_

#define __bswap_constant_32(x) \
     ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) |	      \
      (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))


#endif /* SRC_SWAP_H_ */
